//
//  AlphabetCategoryPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 03/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol ABCCategoryViewProtocol: class {
    func setFirstView(_ view: UIView)
    
    func setPictureView(_ imageView: UIImageView)
    
    func setFactAnimalView(_ button: UIButton)
    func setLetterView(_ button: UIButton)
    
    func setBackgroundABCCategoryImage(_ image: UIImage)
    func setViewWithElementsBacgroundColor(_ color: UIColor)
    func setFactAnimalButtonImage(_ image: UIImage)
    func setLetterButtonImage(_ image: UIImage)
    func setPictureImage(_ image: UIImage)
}

protocol ABCCategoryViewPresenterProtocol:class {
    
    init(_ view: ABCCategoryViewProtocol, _ model: ABCCategoryModel)
    var arrayABCStructure: [ABCStructure] {get set}
    
    func showFirstView()
    func showPictureView()
    func showFactAnimalView()
    func showLetterView()
    
    func showCarouselItemWidth() -> CGFloat
    
    func showBackgroundABC()
    
    func showViewWithElementsBacgroundColor()
    func showFactAnimalButtonImage(_ index: Int)
    func showLetterButtonImage(_ index: Int)
    func showPictureImage(_ index: Int)
        
    func tapOnTheLetter(_ index: Int)
    func tapOnThePicture(_ name: String, _ index: Int)
    func tapOnTheLightBulb(_ index: Int)
    
    func playCurrentLetterSound(_ index: Int)
}

class ABCCategoryPresenter: ABCCategoryViewPresenterProtocol {
    
    weak var view: ABCCategoryViewProtocol?
    let model: ABCCategoryModel!
    
    var audioPlayer: AVAudioPlayer!

    var arrayAllObjects = [Any]()
    var arrayABCStructure = [ABCStructure]()
    
    let showContent = AutoRenewable.shared.showContent

    required init(_ view: ABCCategoryViewProtocol, _ model: ABCCategoryModel) {
        self.view = view
        self.model = model
        
        getAllObjectsFromPlist()
        getDatasForABC()
    }
    
    
    func showBackgroundABC() {
        let backgroundImage = self.model.backgroundImage
        self.view?.setBackgroundABCCategoryImage(backgroundImage)
    }
    
    func showFirstView(){
        let currentView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: UIScreen.main.bounds.width/2.9,
                                        height: UIScreen.main.bounds.width/1.9-110))
        self.view?.setFirstView(currentView)
    }
    
    func showPictureView(){
        let currentView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width/22-10,
                                                    y: UIScreen.main.bounds.width/15-40,
                                                    width: UIScreen.main.bounds.width/3.4-20,
                                                    height: UIScreen.main.bounds.width/2.3-70))
        self.view?.setPictureView(currentView)
    }
    
    func showFactAnimalView(){
        let currentView = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/5+20,
                                                 y: UIScreen.main.bounds.width/50-50,
                                                 width: UIScreen.main.bounds.width/7,
                                                 height: UIScreen.main.bounds.width/7))
        self.view?.setFactAnimalView(currentView)
    }
    
    func showLetterView(){
        let currentView = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/30 - 25,
                                                 y: UIScreen.main.bounds.width/30 - 25,
                                                 width: UIScreen.main.bounds.width/6.5-20,
                                                 height: UIScreen.main.bounds.width/6.5-20))
        self.view?.setLetterView(currentView)
    }
    
    func showCarouselItemWidth() -> CGFloat{
        let carouselWidth =  UIScreen.main.bounds.width/1.6
        return carouselWidth
    }
    
    func showViewWithElementsBacgroundColor(){
        let backgroundColor = UIColor.clear
        self.view?.setViewWithElementsBacgroundColor(backgroundColor)
    }
    
    func showFactAnimalButtonImage(_ index: Int){
        if showContent{
            let imageLightBulb = #imageLiteral(resourceName: "лампочка")
            self.view?.setFactAnimalButtonImage(imageLightBulb)
        }else{
            if index < SHOW_PART_OF_CONTENT{
                let imageLightBulb = #imageLiteral(resourceName: "лампочка")
                self.view?.setFactAnimalButtonImage(imageLightBulb)
            }
        }
    }
    
    func showLetterButtonImage(_ index: Int){
        if showContent{
            guard let stringNameImage = arrayABCStructure[index].letterButtonImageName else { return }
            guard let image = UIImage(named: stringNameImage) else { return }
            self.view?.setLetterButtonImage(image)
        }else{
            if index < SHOW_PART_OF_CONTENT{
                guard let stringNameImage = arrayABCStructure[index].letterButtonImageName else { return }
                guard let image = UIImage(named: stringNameImage) else { return }
                self.view?.setLetterButtonImage(image)
            }
        }
    }
    
    func showPictureImage(_ index: Int){
        if showContent{
            guard let stringNameImage = arrayABCStructure[index].pictureViewImageName else { return }
            guard let image = UIImage(named: stringNameImage) else { return }
            self.view?.setPictureImage(image)
        }else{
            if index < SHOW_PART_OF_CONTENT{
                guard let stringNameImage = arrayABCStructure[index].pictureViewImageName else { return }
                guard let image = UIImage(named: stringNameImage) else { return }
                self.view?.setPictureImage(image)
            }else {
                let stringNameImage = NO_SUBSCRIPTION_IMAGE_NAME
                guard let image = UIImage(named: stringNameImage) else { return }
                self.view?.setPictureImage(image)
            }
        }
    }
    
    func tapOnTheLetter(_ index: Int){
        if showContent{
            guard let name = arrayABCStructure[index].letterTranscriptionSoundName else { return }
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }else{
            if index < SHOW_PART_OF_CONTENT{
                guard let name = arrayABCStructure[index].letterTranscriptionSoundName else { return }
                self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
            }
        }
    }
    
    func tapOnThePicture(_ name: String, _ index: Int){
        if showContent{
            Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                guard let self = self else { return }
                self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
            }
        }else{
            if index >= SHOW_PART_OF_CONTENT{
                Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                    guard let self = self else { return }
                    self.playSomeSound(soundName: CONTENT_LOCK_SOUND_NAME, soundType: SOUND_TYPE)
                }
            }
            if index < SHOW_PART_OF_CONTENT {
                Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                    guard let self = self else { return }
                    self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
                }
            }
        }
    }
    
    func tapOnTheLightBulb(_ index: Int){
        if showContent{
            Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                guard let self = self else { return }
                guard let name = self.arrayABCStructure[index].animalFactName else { return }
                self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
            }
        }else{
            if index < SHOW_PART_OF_CONTENT{
                Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                    guard let self = self else { return }
                    guard let name = self.arrayABCStructure[index].animalFactName else { return }
                    self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
                }
            }
        }
    }
    
    func playCurrentLetterSound(_ index: Int){
        if showContent{
            Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                guard let self = self else { return }
                guard let name = self.arrayABCStructure[index].letterButtonImageName else { return }
                self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
            }
        }else{
            if index < SHOW_PART_OF_CONTENT{
                Timer.scheduledTimer(withTimeInterval: DURATION_PLAY_SOUND, repeats: false) { [weak self] _ in
                    guard let self = self else { return }
                    guard let name = self.arrayABCStructure[index].letterButtonImageName else { return }
                    self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
                }
            }
        }
    }
    
    // MARK: - Private func
    private func getAllObjectsFromPlist(){
        guard let path = Bundle.main.path(forResource: ABC_NAME_PLIST, ofType: PLIST) else { return }
        if let array = NSArray(contentsOfFile: path) as? Array<Any> {
            arrayAllObjects = array
        }
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"ABCPresenter\"")
        }
    }
    
    private func getDatasForABC(){
        var allAlphabetObjects = [ABCStructure]()
        for items in arrayAllObjects{
            let currentObject = items as! [String]
            
            let itemLetter = currentObject[0]
            let itemPicture = currentObject[1]
            let itemPictureSoundName = currentObject[2]
            let itemTranscriptionSoundName = currentObject[3]
            let itemaAnimalFactSoundName = currentObject[4]
            
            allAlphabetObjects.append(ABCStructure(letterButtonImageName: itemLetter,
                                                   pictureViewImageName: itemPicture,
                                                   pictureSoundName: itemPictureSoundName,
                                                   letterTranscriptionSoundName: itemTranscriptionSoundName,
                                                   animalFactName: itemaAnimalFactSoundName))
        }
        arrayABCStructure = allAlphabetObjects
    }
    
}


