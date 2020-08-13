//
//  NumberCategoryPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 03/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol NumbersCategoryViewProtocol: class {
    func setNumbersBackground(_ image: UIImage)
    func setNumberArea(_ image: UIImage)
    
    func setOneBtnImage(_ image: UIImage)
    func setTwoBtnImage(_ image: UIImage)
    func setThreeBtnImage(_ image: UIImage)
    func setFourBtnImage(_ image: UIImage)
    func setFiveBtnImage(_ image: UIImage)
    func setSixBtnImage(_ image: UIImage)
    func setSevenBtnImage(_ image: UIImage)
    func setEightBtnImage(_ image: UIImage)
    func setNineBtnImage(_ image: UIImage)
    func setZeroBtnImage(_ image: UIImage)
}

protocol NumbersCategoryViewPresenterProtocol: class{
    init(_ view: NumbersCategoryViewProtocol, _ model: NumbersModel, _ router: RouterProtocol)
    
    func showNumbersBackground()
    func showNumberArea()
    
    func showOneBtnImage()
    func showTwoBtnImage()
    func showThreeBtnImage()
    func showFourBtnImage()
    func showFiveBtnImage()
    func showSixBtnImage()
    func showSevenBtnImage()
    func showEightBtnImage()
    func showNineBtnImage()
    func showZeroBtnImage()
    
    func tapOnTheSomeNumber(_ index: Int, _ sender: UIButton, _ view: UIView)
    
    func playChooseNumerSound()
    
}

class NumbersCategoryPresenter: NumbersCategoryViewPresenterProtocol{
    
    weak var view: NumbersCategoryViewProtocol?
    let model: NumbersModel!
    let router: RouterProtocol!
    
    var audioPlayer: AVAudioPlayer!
    var arrayNumbersLongNames = [String]()
    
    required init(_ view: NumbersCategoryViewProtocol, _ model: NumbersModel, _ router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
        
        
        getDatasFromPlist()
    }
    
    func showNumbersBackground() {
        let numbersBackground = self.model.numbersBackground
        self.view?.setNumbersBackground(numbersBackground)
    }
    
    func showNumberArea(){
        let numberArea = self.model.numberArea
        self.view?.setNumberArea(numberArea)
    }
    
    func showOneBtnImage() {
        let oneBtnImage = self.model.oneBtn
        self.view?.setOneBtnImage(oneBtnImage)
    }
    
    func showTwoBtnImage() {
        let twoBtnImage = self.model.twoBtn
        self.view?.setTwoBtnImage(twoBtnImage)
    }
    
    func showThreeBtnImage() {
        let threeBtnImage = self.model.threeBtn
        self.view?.setThreeBtnImage(threeBtnImage)
    }
    
    func showFourBtnImage() {
        let fourBtnImage = self.model.fourBtn
        self.view?.setFourBtnImage(fourBtnImage)
    }
    
    func showFiveBtnImage() {
        let fiveBtnImage = self.model.fiveBtn
        self.view?.setFiveBtnImage(fiveBtnImage)
    }
    
    func showSixBtnImage() {
        let sixBtnImage = self.model.sixBtn
        self.view?.setSixBtnImage(sixBtnImage)
    }
    
    func showSevenBtnImage() {
        let sevenBtnImage = self.model.sevenBtn
        self.view?.setSevenBtnImage(sevenBtnImage)
    }
    
    func showEightBtnImage() {
        let eightBtnImage = self.model.eightBtn
        self.view?.setEightBtnImage(eightBtnImage)
    }
    
    func showNineBtnImage() {
        let nineBtnImage = self.model.nineBtn
        self.view?.setNineBtnImage(nineBtnImage)
    }
    
    func showZeroBtnImage() {
        let zeroBtnImage = self.model.zeroBtn
        self.view?.setZeroBtnImage(zeroBtnImage)
    }
    
    func tapOnTheSomeNumber(_ index: Int, _ sender: UIButton, _ view: UIView){
        view.isUserInteractionEnabled = false
        playCurrentNumberSound(index)
        pulsateView(sender)
        Timer.scheduledTimer(withTimeInterval: DURATION_BEFORE_SHOW_SOME_NUMBER, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.router.showSomeNumber(index)
            view.isUserInteractionEnabled = true
        }
        
    }
    
    func playChooseNumerSound(){
        let name = CHOOSE_NUMBER_SOUND_NAME
        Timer.scheduledTimer(withTimeInterval: CHOSE_NUMBER_TIME_INTERVAL, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }
    }
    
    // MARK: Private func
    private func getDatasFromPlist(){
        guard let path = Bundle.main.path(forResource: NUMBER_LONG_NAME_PLIST, ofType: PLIST) else { return }
        guard let arrayNames = NSArray(contentsOfFile: path) else { return }
        for name in arrayNames{
            let currentName = name as! String
            arrayNumbersLongNames.append(currentName)
        }
    }
    
    private func playCurrentNumberSound(_ index: Int){
        Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND_BY_NUMBERS_MODULE, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            let name = self.arrayNumbersLongNames[index]
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"NumbersCategoryPresenter\"")
        }
    }
}
