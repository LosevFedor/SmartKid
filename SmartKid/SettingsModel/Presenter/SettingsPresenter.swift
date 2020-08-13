//
//  SettingsPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 28/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import StoreKit
import AVFoundation

protocol SettingsViewProtocol: class{
    func setGeneralBackgroundImage(image: UIImage)
    func setGeneralBackgroundCloudsImage(image: UIImage)
    func setImageInscriptionsSounds(image: UIImage)
    func setimageInscriptionsContacts(image: UIImage)
    
    func setSubscriptionImage(image: UIImage, isEnableBtn: Bool)
    func setEmailImage(image: UIImage)
    func setMelodyOnImage(image: UIImage)
    func setCloud1Image(image: UIImage)
    func setCloud2Image(image: UIImage)
    func setCloud3Image(image: UIImage)
    func setCloud4Image(image: UIImage)
    
    func setLabelAppNameProduct(label: String)
    func setLabelProductCost(label: String)
    func setLabelDescriptionCost(label: String)
    func setLabelWhatGamesUserGet(label: String)
}

protocol SettingsViewPresenterProtocol: class{
    init(_ view: SettingsViewProtocol, _ model: SettingsModel, _ router: RouterProtocol)
    
    func showGeneralBackgroundImage()
    func showGeneralBackgroundCloudsImage()
    func showImageInscriptionsSounds()
    func showImageInscriptionsContacts()

    func showLabelViewAppNameProduct()
    func showLabelProductCost()
    func showLabelDescriptionCost()
    func showLabelWhatGamesUserGet()
    func showSubscriptionImage()
    func showEmailImage()
    func showMelodyOnImage()
    func showCloud1Image()
    func showCloud2Image()
    func showCloud3Image()
    func showCloud4Image()
    func showCloudMove(_ view: UIView, _ options: UIView.AnimationOptions, _ cloud: UIImageView, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat)
    
    func tapOnTheSubscriptionBtn()
    //func tapOnTheRestoreProductBtn()
    
    func playStatusMelodyImage()
}

class SettingsPresenter: SettingsViewPresenterProtocol {

    weak var view: SettingsViewProtocol?
    
    // MARK: Private property
    private let model: SettingsModel!
    private let router: RouterProtocol!
    private var audioPlayer: AVAudioPlayer!
    
    private let iapManager = IAPManager.shared
    private let autoRenewable = AutoRenewable.shared
    
    // MARK: Init
    required init(_ view: SettingsViewProtocol, _ settings: SettingsModel, _ router: RouterProtocol) {
        self.view = view
        self.model = settings
        self.router = router
    }
    
    // MARK: internal func
    func showGeneralBackgroundImage() {
        let generalBackgroundImage = self.model.generalBackgroundImage
        self.view?.setGeneralBackgroundImage(image: generalBackgroundImage)
    }
    
    func showGeneralBackgroundCloudsImage() {
        let generalBackgroundCloudsImage = self.model.generalBackgroundCloudsImage
        self.view?.setGeneralBackgroundCloudsImage(image: generalBackgroundCloudsImage)
    }
    
    func showImageInscriptionsSounds() {
        let imageInscriptionsSounds = self.model.imageInscriptionsSounds
        self.view?.setImageInscriptionsSounds(image: imageInscriptionsSounds)
    }
    
    func showImageInscriptionsContacts() {
        let imageInscriptionsContacts = self.model.imageInscriptionsContacts
        self.view?.setimageInscriptionsContacts(image: imageInscriptionsContacts)
    }
    
    func showSubscriptionImage() {
        if autoRenewable.showContent{
            let imageSubscription = self.model.ARSBtnActivate
            self.view?.setSubscriptionImage(image: imageSubscription, isEnableBtn: false)
            return
        }
        let imageSubscription = self.model.ARSBtnNotActivate
        self.view?.setSubscriptionImage(image: imageSubscription, isEnableBtn: true)
    }
    
    func showEmailImage(){
        let emailImage = self.model.emailImage
        self.view?.setEmailImage(image: emailImage)
    }
    
    func showMelodyOnImage() {
        let statusMusic = BackgroundSound.shared.getBackgroundMusicStatus()
        var musicImage: UIImage!
        if statusMusic {
            musicImage = self.model.musicOnImage
            self.view?.setMelodyOnImage(image: musicImage)
        }else{
            musicImage = self.model.musicOffImage
            self.view?.setMelodyOnImage(image: musicImage)
        }
        
    }
    
    func playStatusMelodyImage(){
        let statusMusic = BackgroundSound.shared.getBackgroundMusicStatus()
        if statusMusic{
            playSomeSound(soundName: BACKGROUND_MUSIC_ON_NAME, soundType: SOUND_TYPE)
        }else{
            playSomeSound(soundName: BACKGROUND_MUSIC_OFF_NAME, soundType: SOUND_TYPE)
        }
    }
    
    func showCloud1Image() {
        let cloud1Image = self.model.cloud1Image
        self.view?.setCloud1Image(image: cloud1Image)
    }
    
    func showCloud2Image() {
        let cloud2Image = self.model.cloud2Image
        self.view?.setCloud2Image(image: cloud2Image)
    }
    
    func showCloud3Image() {
        let cloud3Image = self.model.cloud3Image
        self.view?.setCloud3Image(image: cloud3Image)
    }
    
    func showCloud4Image() {
        let cloud4Image = self.model.cloud4Image
        self.view?.setCloud4Image(image: cloud4Image)
    }
    
    func showCloudMove(_ view: UIView, _ options: UIView.AnimationOptions, _ cloud: UIImageView, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            var cloudFrame = cloud.frame
            cloudFrame.origin.x -= moveByX
            cloud.frame = cloudFrame
        }, completion: nil)
    }
    
    func showLabelViewAppNameProduct(){
        let curentString = SUBSCRIBE_USERNAME_TEXT
        view?.setLabelAppNameProduct(label: curentString)
    }
    
    func showLabelProductCost(){
        guard let product = iapManager.products.first else { return }
        let curentLabel = COST_DESCRIPTION_TEXT
        let localeCost = getLocaleCost(product:product)
        let currentString = "\(curentLabel) \(localeCost)"
        view?.setLabelProductCost(label: currentString)
    }
    
    func showLabelWhatGamesUserGet(){
        let labelDescriptionFunctionality = WHAT_USER_GET_WHEN_SUBSCRIBE_TEXT
        view?.setLabelWhatGamesUserGet(label:labelDescriptionFunctionality)
    }
    
    func showLabelDescriptionCost(){
        let labelDescription = SUDSCIBE_DESCRIPTION_TEXT
        view?.setLabelDescriptionCost(label:labelDescription)
    }
    
    func tapOnTheSubscriptionBtn(){
        iapManager.purchaseProduct()
    }
    
//    func tapOnTheRestoreProductBtn(){
//        iapManager.restoreCompletedTransactions()
//    }
    
    // MARK: Private func
    private func getLocaleCost(product: SKProduct) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product.priceLocale
        guard let cost = numberFormatter.string(from: product.price) else { return "No price for your region"}
        return cost
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"HomePresenter\"")
        }
    }
}
