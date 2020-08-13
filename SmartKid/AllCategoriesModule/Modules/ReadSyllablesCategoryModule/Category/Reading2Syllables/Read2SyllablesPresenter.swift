//
//  ReadingTwoSyllablePresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 06/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

protocol Read2SyllablesViewProtocol: class{
    func setGeneralBackgroundImage(image:UIImage)
    func setCurrentImage(image: String)
    
    func setOneButtonImage(image: UIImage)
    func setTwoButtonImage(image: UIImage)
    
    func setSyllableOneBtnTitle(text: String)
    func setSyllableTwoBtnTitle(text: String)
}

protocol Read2SyllablesViewPresenterProtocol: class{
    init(view: Read2SyllablesViewProtocol, model: Read2SyllablesModel )
    
    func showGeneralBackgroundImage()
    func showCurrentImage(cyrrentCountGame: Int, isHudenImage: Bool)
    func showCurrentImageAnimation()
    func showOneButtonImage()
    func showTwoButtonImage()
    func showActiveTwoButtonImage()
    func showFinishActiveOneButtonImage()
    func showFinishActiveTwoButtonImage()
    func showOneButtonAction(_ currentScene: Int)
    func showTwoButtonAction(_ currentScene: Int)
    func showTogetherButtonAction(_ currentScene: Int)
    func showSyllableOneBtnTitle(_ cyrrentCountGame: Int)
    func showSyllableTwoBtnTitle(_ cyrrentCountGame: Int)
    func playSoundSyllableOne(cyrrentCountGame: Int)
    func playSoundSyllableTwo(cyrrentCountGame: Int)
    func playSound(name: String)
    
    func showSpriteKitView(scene: GameScene2, view: SKView, outletImage: UIImageView, outletOneButton: UIButton, outletTwoButton: UIButton)
    func showTittle(cyrrentCountGame: Int, currentScene: GameScene2)
}

class Read2SyllablesPresenter: Read2SyllablesViewPresenterProtocol{
    var outletOneButton: UIButton!
    var outletTwoButton: UIButton!
    var outletImage: UIImageView!
    
    var syllableOne: String?
    var syllableTwo: String?
    var fakeSyllableOne: String?
    var fakeSyllableTwo: String?
    var fakeSyllableThree: String?
    
    weak var view: Read2SyllablesViewProtocol!
    var audioPlayer: AVAudioPlayer!
    let model: Read2SyllablesModel
    
    required init(view: Read2SyllablesViewProtocol, model: Read2SyllablesModel) {
        self.view = view
        self.model = model
    }
    
    func showGeneralBackgroundImage(){
        let generalBackgroundImage = self.model.generalBackgroundImage
        self.view.setGeneralBackgroundImage(image: generalBackgroundImage)
    }
    
    func showOneButtonImage(){
        let buttonOneImage = self.model.buttonActive
        self.view.setOneButtonImage(image: buttonOneImage)
    }
    
    func showTwoButtonImage(){
        let buttonTwoImage = self.model.buttonNotActive
        self.view.setTwoButtonImage(image: buttonTwoImage)
    }
    
    func showFinishActiveOneButtonImage(){
        let finishActiveOneButtonImage = self.model.buttonFinishActive
        self.view.setOneButtonImage(image: finishActiveOneButtonImage)
    }
    
    func showActiveTwoButtonImage(){
        let activeTwoButtonImage = self.model.buttonActive
        self.view.setTwoButtonImage(image: activeTwoButtonImage)
    }
    
    func showFinishActiveTwoButtonImage(){
        let finishActiveTwoButtonImage = self.model.buttonFinishActive
        self.view.setTwoButtonImage(image: finishActiveTwoButtonImage)
    }
    
    func showOneButtonAction(_ currentScene: Int){
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletOneButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.playSoundSyllableOne(cyrrentCountGame: currentScene)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MAX_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletOneButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
        })
    }
    
    func showTwoButtonAction(_ currentScene: Int){
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletTwoButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.playSoundSyllableTwo(cyrrentCountGame: currentScene)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MAX_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletTwoButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
        })
    }
    
    func showTogetherButtonAction(_ currentScene: Int){
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: {
            self.outletOneButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
            self.outletTwoButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.playSoundWord(cyrrentCountGame: currentScene)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MAX_DELAY, animations: {
            self.outletOneButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
            self.outletTwoButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
        })
    }
    
    func showSyllableOneBtnTitle(_ cyrrentCountGame: Int) {
        let arrayRead2SyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayRead2SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let syllableOneBtnTitle = dictionary[KEY_ONE_SYLLABLE] else { return }
        
        self.view.setSyllableOneBtnTitle(text: syllableOneBtnTitle)
    }
    
    func showSyllableTwoBtnTitle(_ cyrrentCountGame: Int) {
        let arrayRead2SyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayRead2SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let syllableTwoBtnTitle = dictionary[KEY_TWO_SYLLABLE] else { return }
        
        self.view.setSyllableTwoBtnTitle(text: syllableTwoBtnTitle)
    }
    
    func showCurrentImage(cyrrentCountGame: Int, isHudenImage: Bool){
        let arrayRead2SyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayRead2SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let currentImage = dictionary[KEY_IMAGE] else { return }
        
        guard let outletImage = outletImage else { return }
        outletImage.isHidden = isHudenImage
        self.view.setCurrentImage(image: currentImage)
    }
    
    func showCurrentImageAnimation(){
        let options: UIView.AnimationOptions = [.curveLinear, .autoreverse]
        outletImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        UIView.animate(withDuration: 4,
                       delay: 3,
                       options: options,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.outletImage.transform = CGAffineTransform.identity
            }, completion: nil)
    }
    
    //    func delayedAllPerforms(){
    //        NSObject.cancelPreviousPerformRequests(withTarget: currentScene!)
    //    }
    
    func playSoundSyllableOne(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]
        
        guard let syllableOne = dictionary[KEY_ONE_SYLLABLE] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: syllableOne, soundType: typeSound)
    }
    
    func playSoundSyllableTwo(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]
        
        guard let syllableTwo = dictionary[KEY_TWO_SYLLABLE] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: syllableTwo, soundType: typeSound)
    }
    
    func playSound(name: String){
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
    }
    
    func playSoundWord(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]
        
        guard let wordName = dictionary[KEY_NAME] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: wordName, soundType: typeSound)
    }
    
    func showSpriteKitView(scene: GameScene2, view: SKView, outletImage: UIImageView, outletOneButton: UIButton, outletTwoButton: UIButton){
        
        self.outletOneButton = outletOneButton
        self.outletTwoButton = outletTwoButton
        self.outletImage = outletImage
        
        DispatchQueue.main.async {
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
    
    func showTittle(cyrrentCountGame: Int, currentScene: GameScene2) {
        let arrayTitles = getCurrentGhostArrayTitles(index: cyrrentCountGame)
        
        let title1 = arrayTitles[0]
        let title2 = arrayTitles[1]
        let title3 = arrayTitles[2]
        let title4 = arrayTitles[3]
        let title5 = arrayTitles[4]
        
        let currentTittleBtnOne = syllableOne
        let currentTittleBtnTwo = syllableTwo
        
        currentScene.object1.setObjectTitle(title: title1)
        currentScene.object2.setObjectTitle(title: title2)
        currentScene.object3.setObjectTitle(title: title3)
        currentScene.object4.setObjectTitle(title: title4)
        currentScene.object5.setObjectTitle(title: title5)
        
        currentScene.currentOneSyllableInButtonOne = currentTittleBtnOne
        currentScene.currentTwoSyllableInButtonTwo = currentTittleBtnTwo
    }
    
    private func getCurrentGhostArrayTitles(index: Int) -> [String]{
        let arrayRead2SyllableElements = self.model.shufledRead2SyllablesArray
        let dictionary = arrayRead2SyllableElements[index].value as! [String:String]
        
        syllableOne = dictionary[KEY_ONE_SYLLABLE]
        syllableTwo = dictionary[KEY_TWO_SYLLABLE]
        fakeSyllableOne = randomFakeSyllable()
        fakeSyllableTwo = randomFakeSyllable()
        fakeSyllableThree = randomFakeSyllable()
        
        let arrayTitleObjects = [syllableOne, syllableTwo, fakeSyllableOne, fakeSyllableTwo, fakeSyllableThree].shuffled() as! [String]
        return arrayTitleObjects
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"ReadSyllablesPresenter\"")
        }
    }
}
