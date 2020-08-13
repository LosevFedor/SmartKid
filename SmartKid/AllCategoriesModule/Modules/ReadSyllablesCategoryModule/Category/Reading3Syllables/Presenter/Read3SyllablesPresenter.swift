//
//  Read3SyllablesPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 11/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//
import UIKit
import SpriteKit
import AVFoundation

protocol Read3SyllablesViewProtocol: class {
    func setGeneralBackgroundImage(image:UIImage)
    func setCurrentImage(image: String)
    
    func setOneButtonImage(image: UIImage)
    func setTwoButtonImage(image: UIImage)
    func setThreeButtonImage(image: UIImage)
    
    func setSyllableOneBtnTitle(text: String)
    func setSyllableTwoBtnTitle(text: String)
    func setSyllableThreeBtnTitle(text: String)
}

protocol Read3SyllablesViewPresenterProtocol: class {
    init(view: Read3SyllablesViewProtocol, model:Read3SyllablesModel)
    
    func showGeneralBackgroundImage()
    func showCurrentImage(cyrrentCountGame: Int, isHudenImage: Bool)
    func showCurrentImageAnimation()
    
    func showOneButtonImage()
    func showTwoButtonImage()
    func showThreeButtonImage()
    
    func showActiveTwoButtonImage()
    func showActiveThreeButtonImage()
    
    func showFinishActiveOneButtonImage()
    func showFinishActiveTwoButtonImage()
    func showFinishActiveThreeButtonImage()
    
    func showOneButtonAction(_ currentScene: Int)
    func showTwoButtonAction(_ currentScene: Int)
    func showThreeButtonAction(_ currentScene: Int)
    func showTogetherButtonsAction(_ currentScene: Int)
    
    func showSyllableOneBtnTitle(_ cyrrentCountGame: Int)
    func showSyllableTwoBtnTitle(_ cyrrentCountGame: Int)
    func showSyllableThreeBtnTitle(_ cyrrentCountGame: Int)
    
    func playSoundSyllableOne(cyrrentCountGame: Int)
    func playSoundSyllableTwo(cyrrentCountGame: Int)
    func playSoundSyllableThree(cyrrentCountGame: Int)
    
    func showSpriteKitView(_ scene: GameScene3, _ view: SKView, _ outletImage: UIImageView, _ outletOneButton: UIButton, _ outletTwoButton: UIButton, _ outletThreeButton: UIButton)
    func showTittle(cyrrentCountGame: Int, currentScene: GameScene3)
}

class Read3SyllablesPresenter: Read3SyllablesViewPresenterProtocol {
    
    var outletOneButton: UIButton!
    var outletTwoButton: UIButton!
    var outletThreeButton: UIButton!
    var outletImage: UIImageView!
    
    var syllableOne: String?
    var syllableTwo: String?
    var syllableThree: String?
    
    var fakeSyllableOne: String?
    var fakeSyllableTwo: String?
    var fakeSyllableThree: String?
    
    weak var view: Read3SyllablesViewProtocol!
    var audioPlayer: AVAudioPlayer!
    let model: Read3SyllablesModel
    
    required init(view: Read3SyllablesViewProtocol, model: Read3SyllablesModel) {
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
    
    func showThreeButtonImage(){
        let buttonThreeImage = self.model.buttonNotActive
        self.view.setThreeButtonImage(image: buttonThreeImage)
    }
    
    func showFinishActiveOneButtonImage(){
        let finishActiveOneButtonImage = self.model.buttonFinishActive
        self.view.setOneButtonImage(image: finishActiveOneButtonImage)
    }
    
    func showActiveTwoButtonImage(){
        let activeTwoButtonImage = self.model.buttonActive
        self.view.setTwoButtonImage(image: activeTwoButtonImage)
    }
    
    func showActiveThreeButtonImage(){
        let activeThreeButtonImage = self.model.buttonActive
        self.view.setThreeButtonImage(image: activeThreeButtonImage)
    }
    
    func showFinishActiveTwoButtonImage(){
        let finishActiveTwoButtonImage = self.model.buttonFinishActive
        self.view.setTwoButtonImage(image: finishActiveTwoButtonImage)
    }
    
    func showFinishActiveThreeButtonImage(){
        let finishActiveThreeButtonImage = self.model.buttonFinishActive
        self.view.setThreeButtonImage(image: finishActiveThreeButtonImage)
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
    
    func showThreeButtonAction(_ currentScene: Int){
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletThreeButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.playSoundSyllableThree(cyrrentCountGame: currentScene)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MAX_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.outletThreeButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
        })
    }
    
    func showTogetherButtonsAction(_ currentScene: Int){
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: {
            self.outletOneButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
            self.outletTwoButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
            self.outletThreeButton.transform = CGAffineTransform(scaleX: INCREASE_BUTTON, y: INCREASE_BUTTON)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MIN_DELAY, animations: { [weak self] in
            guard let self = self else { return }
            self.playSoundWord(cyrrentCountGame: currentScene)
        })
        
        UIView.animate(withDuration: BUTTON_ACTION_WITH_DURATION, delay: BUTTON_ACTION_MAX_DELAY, animations: {
            self.outletOneButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
            self.outletTwoButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
            self.outletThreeButton.transform = CGAffineTransform(scaleX: DECREASE_BUTTON, y: DECREASE_BUTTON)
        })
    }
    
    func showSyllableOneBtnTitle(_ cyrrentCountGame: Int) {
        let arrayRead3SyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayRead3SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let syllableOneBtnTitle = dictionary[KEY_ONE_SYLLABLE] else { return }
        
        self.view.setSyllableOneBtnTitle(text: syllableOneBtnTitle)
    }
    
    func showSyllableTwoBtnTitle(_ cyrrentCountGame: Int) {
        let arrayRead3SyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayRead3SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let syllableTwoBtnTitle = dictionary[KEY_TWO_SYLLABLE] else { return }
        
        self.view.setSyllableTwoBtnTitle(text: syllableTwoBtnTitle)
    }
    
    func showSyllableThreeBtnTitle(_ cyrrentCountGame: Int) {
        let arrayRead3SyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayRead3SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let syllableTwoBtnTitle = dictionary[KEY_THREE_SYLLABLE] else { return }
        
        self.view.setSyllableThreeBtnTitle(text: syllableTwoBtnTitle)
    }
    
    func showCurrentImage(cyrrentCountGame: Int, isHudenImage: Bool){
        let arrayRead3SyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayRead3SyllableElements[cyrrentCountGame].value as! [String:String]
        guard let currentImage = dictionary[KEY_IMAGE] else { return }
        
        guard let outletImage = outletImage else { return }
        outletImage.isHidden = isHudenImage
        self.view.setCurrentImage(image: currentImage)
    }
    
    func showCurrentImageAnimation(){
        let options: UIView.AnimationOptions = [.curveLinear, .autoreverse]
        outletImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        UIView.animate(withDuration: 4,
                       delay: 4,
                       options: options,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.outletImage.transform = CGAffineTransform.identity
            }, completion: nil)
    }
    
    func playSoundSyllableOne(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]

        guard let syllableOne = dictionary[KEY_ONE_SYLLABLE] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: syllableOne, soundType: typeSound)
    }
    
    func playSoundSyllableTwo(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]

        guard let syllableTwo = dictionary[KEY_TWO_SYLLABLE] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: syllableTwo, soundType: typeSound)
    }
    
    func playSoundSyllableThree(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]

        guard let syllableThree = dictionary[KEY_THREE_SYLLABLE] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: syllableThree, soundType: typeSound)
    }
    
    func playSoundWord(cyrrentCountGame: Int){
        let arrayReadSyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayReadSyllableElements[cyrrentCountGame].value as! [String:String]
        
        guard let wordName = dictionary[KEY_NAME] else { return }
        guard let typeSound = dictionary[KEY_TYPE_SOUND] else { return }
        
        playSomeSound(soundName: wordName, soundType: typeSound)
    }
    
    func showSpriteKitView(_ scene: GameScene3, _ view: SKView, _ outletImage: UIImageView, _ outletOneButton: UIButton, _ outletTwoButton: UIButton, _ outletThreeButton: UIButton){
        
        self.outletOneButton = outletOneButton
        self.outletTwoButton = outletTwoButton
        self.outletThreeButton = outletThreeButton
        
        self.outletImage = outletImage
        
        DispatchQueue.main.async { 
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
    
    func showTittle(cyrrentCountGame: Int, currentScene: GameScene3) {
        let arrayTitles = getCurrentArrayObjectsTitles(index: cyrrentCountGame)
        
        let title1 = arrayTitles[0]
        let title2 = arrayTitles[1]
        let title3 = arrayTitles[2]
        let title4 = arrayTitles[3]
        let title5 = arrayTitles[4]
        
        currentScene.object1.setObjectTitle(title: title1)
        currentScene.object2.setObjectTitle(title: title2)
        currentScene.object3.setObjectTitle(title: title3)
        currentScene.object4.setObjectTitle(title: title4)
        currentScene.object5.setObjectTitle(title: title5)
        
        let currentTittleBtnOne = syllableOne
        let currentTittleBtnTwo = syllableTwo
        let currentTittleBtnThree = syllableThree
        
        currentScene.currentOneSyllableInButtonOne = currentTittleBtnOne
        currentScene.currentTwoSyllableInButtonTwo = currentTittleBtnTwo
        currentScene.currentThreeSyllableInButtonThree = currentTittleBtnThree
    }
    
    private func getCurrentArrayObjectsTitles(index: Int) -> [String]{
        let arrayRead3SyllableElements = self.model.shufledRead3SyllablesArray
        let dictionary = arrayRead3SyllableElements[index].value as! [String:String]
        
        syllableOne = dictionary[KEY_ONE_SYLLABLE]
        syllableTwo = dictionary[KEY_TWO_SYLLABLE]
        syllableThree = dictionary[KEY_THREE_SYLLABLE]
        
        fakeSyllableOne = randomFakeSyllable()
        fakeSyllableTwo = randomFakeSyllable()
        
        let arrayTitleObjects = [syllableOne, syllableTwo, syllableThree, fakeSyllableOne, fakeSyllableTwo].shuffled() as! [String]
        return arrayTitleObjects
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"Read3SyllablesPresenter\"")
        }
    }
    
}

