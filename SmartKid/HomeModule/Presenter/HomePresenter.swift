//
//  HomePresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 28/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol HomeViewProtocol: class{
    func setHomeBackgroundImage(_ image: UIImage)
    func setHomeBackgroundCloudsImage(_ image: UIImage)
    func setHomeAppNameImage(_ image: UIImage)
    func setHomePlayButtonImage(_ image: UIImage)
    func setHomeSettingsButtonImage(_ image: UIImage)
    
    func setCloud1Image(_ image: UIImage)
    func setCloud2Image(_ image: UIImage)
    func setCloud3Image(_ image: UIImage)
    func setCloud4Image(_ image: UIImage)
    func setCloud5Image(_ image: UIImage)
    func setCloud6Image(_ image: UIImage)
    
    func setResultImage(_ image: UIImage)
    
    func setRandomNameImageNumbers(firstIndex: Int, secondIndex: Int, thirdIndex: Int)
}

protocol HomeViewPresenterProtocol: class{
    
    var arrayNameImageNumbers: [String] { get }
    var arrayFieldWithNumbers: [String] { get }
    
    var firstRandomIndex: Int? { get }
    var secondRandomIndex: Int? { get }
    var thirdRandomIndex: Int? { get }
    
    var isFirstNumberFieldFull: Bool { get }
    var isSecondNumberFieldFull: Bool { get }
    var isThirdNumberFieldFull: Bool { get }
    
    init(_ view: HomeViewProtocol, _ model: HomeModel, _ router: RouterProtocol)
    
    func showHomeBackgroundImage()
    func showHomeBackgroundCloudsImage()
    func showHomeAppNameImage()
    func showHomePlayButtonImage()
    func showHomeSettingsButtonImage()
    
    func showRandomNameImageNumbers()
    
    func showCloud1Image()
    func showCloud2Image()
    func showCloud3Image()
    func showCloud4Image()
    func showCloud5Image()
    func showCloud6Image()
    
    func showCloudMove(_ view: UIView, _ options: UIView.AnimationOptions, _ cloud: UIImageView, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat)
    
    func getCurrentEnteredUserResult(firsImageView: UIImageView, secondImageView: UIImageView, thirdImageView: UIImageView) -> UIImageView?
    func enableButtonCheckUserResult() -> Bool
    func showResultImage(name: String)
    
    func generateRandomIndexes()
    
    func tapOnTheSettings()
    func tapOnTheStartStudy()
    
    func playStartGameSound()
    func playSettingsAdult()
}

class HomePresenter: HomeViewPresenterProtocol{
    
    weak var view: HomeViewProtocol?
    let model: HomeModel!
    let router: RouterProtocol!

    private var audioPlayer: AVAudioPlayer!
    var arrayNameImageNumbers: [String] = [String]()
    var arrayFieldWithNumbers: [String] = [String]()
    
    var firstRandomIndex: Int? = nil
    var secondRandomIndex: Int? = nil
    var thirdRandomIndex: Int? = nil
    
    var isFirstNumberFieldFull: Bool = false
    var isSecondNumberFieldFull: Bool = false
    var isThirdNumberFieldFull: Bool = false
    
    required init(_ view: HomeViewProtocol, _ model: HomeModel, _ router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router

        getArrayNameImageNumbersFromPlist()
        getArrayFieldWithNumbersFronPlist()
        
        createUUIDifInided()
    }
    
    // MARK: Private func
    private func createUUIDifInided(){
        let isUUIDExist = GeneratorUserUID.shared.getStatuskUUID()
        if !isUUIDExist{
            GeneratorUserUID.shared.createUUIDIfNided()
        }
    }
    
    private func getArrayNameImageNumbersFromPlist(){
        guard let path = Bundle.main.path(forResource: NAME_IMAGE_NUMBERS_NAME_PLIST, ofType: PLIST) else { return }
        let array = NSArray(contentsOfFile: path)
        for item in array!{
            arrayNameImageNumbers.append(item as! String)
        }
    }
    
    private func getArrayFieldWithNumbersFronPlist(){
        guard let path = Bundle.main.path(forResource: FIELD_WITH_NUMBERS_NAME_PLIST, ofType: PLIST) else { return }
        let array = NSArray(contentsOfFile: path)
        for item in array!{
            arrayFieldWithNumbers.append(item as! String)
        }
    }
    
    // MARK: Internal func
    func showResultImage(name: String){
        guard let resultImagebyName = UIImage(named: name) else { return }
        self.view?.setResultImage(resultImagebyName)
    }
    
    func enableButtonCheckUserResult() -> Bool {
        if isFirstNumberFieldFull && isSecondNumberFieldFull && isThirdNumberFieldFull{
            return true
        }else{
            return false
        }
    }
    
    func getCurrentEnteredUserResult(firsImageView: UIImageView, secondImageView: UIImageView, thirdImageView: UIImageView) -> UIImageView?{
        if firsImageView.image == UIImage(named: DEFAULD_FIELD_FOR_NUMBER){
            isFirstNumberFieldFull = true
            return firsImageView
        }
        
        if secondImageView.image == UIImage(named: DEFAULD_FIELD_FOR_NUMBER){
            isSecondNumberFieldFull = true
            return secondImageView
        }
        
        if thirdImageView.image == UIImage(named: DEFAULD_FIELD_FOR_NUMBER){
            isThirdNumberFieldFull = true
            return thirdImageView
        }
        return nil
    }
    
    func showRandomNameImageNumbers(){
        guard let first = firstRandomIndex else { return }
        guard let second = secondRandomIndex else { return }
        guard let third = thirdRandomIndex else { return }
        
        self.view?.setRandomNameImageNumbers(firstIndex: first, secondIndex: second, thirdIndex: third)
    }
    
    func generateRandomIndexes(){
        self.firstRandomIndex = Int.random(in: 0...9)
        self.secondRandomIndex = Int.random(in: 0...9)
        self.thirdRandomIndex = Int.random(in: 0...9)
    }
    
    func showHomeBackgroundImage() {
        guard let homeBackgroundImage = self.model.homeBackgroundImage else { return }
        self.view?.setHomeBackgroundImage(homeBackgroundImage)
    }
    
    func showHomeBackgroundCloudsImage() {
        guard let homeBackgroundCloudsImage = self.model.homeBackgroundCloudsImage else { return }
        self.view?.setHomeBackgroundCloudsImage(homeBackgroundCloudsImage)
    }
    
    func showHomeAppNameImage() {
        guard let homeAppNameImage = self.model.homeAppNameImage else { return }
        self.view?.setHomeAppNameImage(homeAppNameImage)
    }
    
    func showHomePlayButtonImage() {
        guard let homePlayButtonImage = self.model.homePlayButtonImage else { return }
        self.view?.setHomePlayButtonImage(homePlayButtonImage)
    }
    
    func showHomeSettingsButtonImage() {
        guard let homeSettingsButtonImage = self.model.homeSettingsButtonImage else { return }
        self.view?.setHomeSettingsButtonImage(homeSettingsButtonImage)
    }
    
    func showCloud1Image() {
        guard let cloud1Image = self.model.cloud1 else { return }
        self.view?.setCloud1Image(cloud1Image)
    }
    
    func showCloud2Image() {
        guard let cloud2Image = self.model.cloud2 else { return }
        self.view?.setCloud2Image(cloud2Image)
    }
    
    func showCloud3Image() {
        guard let cloud3Image = self.model.cloud3 else { return }
        self.view?.setCloud3Image(cloud3Image)
    }
    
    func showCloud4Image() {
        guard let cloud4Image = self.model.cloud4 else { return }
        self.view?.setCloud4Image(cloud4Image)
    }
    
    func showCloud5Image() {
        guard let cloud5Image = self.model.cloud5 else { return }
        self.view?.setCloud5Image(cloud5Image)
    }
    
    func showCloud6Image() {
        guard let cloud6Image = self.model.cloud6 else { return }
        self.view?.setCloud6Image(cloud6Image)
    }
    
    func showCloudMove(_ view: UIView, _ options: UIView.AnimationOptions, _ cloud: UIImageView, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            var cloudFrame = cloud.frame
            cloudFrame.origin.x -= moveByX
            cloud.frame = cloudFrame
            //view.layoutIfNeeded() thos is metod dont nidet here
        }, completion: nil)
    }
    
    func tapOnTheSettings(){
        router.showSettingsModule()
    }
    
    func tapOnTheStartStudy(){
        router.showAllCategoriesModule()
    }
    
    func playStartGameSound() {
        let name = START_GAME_SOUND_NAME
        Timer.scheduledTimer(withTimeInterval: START_GAME_SOUND_TIME_INTERVAL, repeats: false) { [weak self]_ in
            guard let self = self else { return }
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }
    }
    
    func playSettingsAdult(){
        let name = SETTINGS_JUST_ADULT
        self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
    }
}

// MARK: extension Play sound
extension HomePresenter {
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
