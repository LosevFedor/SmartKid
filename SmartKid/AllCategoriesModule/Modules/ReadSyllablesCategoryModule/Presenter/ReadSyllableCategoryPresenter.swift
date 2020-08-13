//
//  ReadSyllableCategoryPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 13/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol ReadSyllableCategoryViewProtocol: class {
    func setGeneralBackgroundImage(_ image: UIImage)
    func setSyllablesImage(_ image: UIImage)
    func set2SyllablesImage(_ image: UIImage)
    func set3SyllablesImage(_ image: UIImage)
}

protocol ReadSyllableCategoryViewPresenterProtocol: class {
    init(_ view: ReadSyllableCategoryViewProtocol, _ model: ReadSyllableCategoryModel, _ router: RouterProtocol)
    
    func showGeneralBackgroundImage()
    func showSyllablesImage()
    func show2SyllablesImage()
    func show3SyllablesImage()
    
    func tapOnTheSyllablesBtn()
    func tapOnThe2SyllablesBtn()
    func tapOnThe3SyllablesBtn()
    
    func playChooseDifficultySound()
    func playContentLock()
}

class ReadSyllableCategoryPresenter: ReadSyllableCategoryViewPresenterProtocol{
    
    weak var view: ReadSyllableCategoryViewProtocol?
    var model: ReadSyllableCategoryModel!
    var router: RouterProtocol!
    var audioPlayer: AVAudioPlayer!
    
    required init(_ view: ReadSyllableCategoryViewProtocol, _ model: ReadSyllableCategoryModel, _ router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
    
    func showGeneralBackgroundImage() {
        let generalBackgroundImage = self.model.generalBackgroundImage
        self.view?.setGeneralBackgroundImage(generalBackgroundImage)
    }
    
    func showSyllablesImage(){
        let syllablesImage = self.model.syllablesImage
        self.view?.setSyllablesImage(syllablesImage)
    }
    
    func show2SyllablesImage() {
        let twoSyllablesImage = self.model.twoSyllablesImage
        self.view?.set2SyllablesImage(twoSyllablesImage)
    }
    
    func show3SyllablesImage() {
        let threeSyllablesImage = self.model.threeSyllablesImage
        self.view?.set3SyllablesImage(threeSyllablesImage)
    }
    
    func tapOnTheSyllablesBtn() {
        let name = SYLLABLE_LEVEL_ONE_SOUND_NAME
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
        Timer.scheduledTimer(withTimeInterval: SYLLABLE_LEVEL_ONE_TIME_INTERVAL, repeats: false) { [weak self]_ in
            guard let self = self else { return }
            self.router.showReadSyllables()
        }
    }
    
    func tapOnThe2SyllablesBtn() {
        let name = SYLLABLE_LEVEL_TWO_SOUND_NAME
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
        Timer.scheduledTimer(withTimeInterval: SYLLABLE_LEVEL_TWO_TIME_INTERVAL, repeats: false) { [weak self]_ in
            guard let self = self else { return }
            self.router.showRead2Syllables()
        }
    }
    
    func tapOnThe3SyllablesBtn() {
        let name = SYLLABLE_LEVEL_THREE_SOUND_NAME
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
        Timer.scheduledTimer(withTimeInterval: SYLLABLE_LEVEL_THREE_TIME_INTERVAL, repeats: false) { [weak self]_ in
            guard let self = self else { return }
            self.router.showRead3Syllables()
        }
    }
    
    func playChooseDifficultySound(){
        let name = CHOOSE_DIFFICULTY_SOUND_NAME
        Timer.scheduledTimer(withTimeInterval: CHOOSE_DIFFICULTY_TIME_INTERVAL, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }
    }
    
    func playContentLock() {
        let name = CONTENT_LOCK_SOUND_NAME
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
    }
    
    // MARK: - Private func
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
