//
//  CategoriesPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 29/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol AllCategoriesViewProtocol:class {
    func setGeneralBackgroundImage(_ image: UIImage)
    func setGeneralBackgroundCloudImage(_ image: UIImage)
    
    func setSyllablesBoyImage(_ image: UIImage)
    func setAdditionAndSubtractionGirlImage(_ image: UIImage)
    
    func setNumbersImage(_ image: UIImage)
    func setAlphabetImage(_ image: UIImage)
    
    func setSyllablesTextImage(_ image: UIImage)
    func setAdditionAndSubtractionTextImage(_ image: UIImage)
    func setNumbersTextImage(_ image: UIImage)
    func setAlphabetTextImage(_ image: UIImage)
    
    func setCloud1Image(_ image: UIImage)
    func setCloud2Image(_ image: UIImage)
    func setCloud3Image(_ image: UIImage)
    func setCloud4Image(_ image: UIImage)
    func setCloud5Image(_ image: UIImage)
    func setCloud6Image(_ image: UIImage)
    func setCloud7Image(_ image: UIImage)
}

protocol CategoriesViewPresenterProtocol:class {
    
    init(_ view: AllCategoriesViewProtocol, _ model: AllCategoriesModel, _ router: RouterProtocol)
    
    func showGeneralBackgroundImage()
    func showGeneralBackgroundCloudImage()
    
    func showSyllablesBoyImage()
    func showAdditionAndSubtractionGirlImage()
    
    func showNumbersImage()
    func showAlphabetImage()
    
    func showSyllablesTextImage()
    func showAdditionAndSubtractionTextImage()
    func showNumbersTextImage()
    func showAlphabetTextImage()
    
    func showCloud1Image()
    func showCloud6Image()
    
    func tapOnTheAlphabetCategory()
    func tapOnTheNumbersCategory()
    func tapOnTheReadSyllablesCategory()
    func tapOnTheAdditionAndSubtractionCategory()
    
    func playChooseGameSound()
    func playContentLock()
}

class AllCategoriesPresenter: CategoriesViewPresenterProtocol {
   
    weak var view: AllCategoriesViewProtocol?
    let model: AllCategoriesModel!
    let router: RouterProtocol!
    var audioPlayer: AVAudioPlayer!
    
    required init(_ view: AllCategoriesViewProtocol, _ model: AllCategoriesModel, _ router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
    
    func showGeneralBackgroundImage() {
        let backgroundImage = self.model.generalBackground
        self.view?.setGeneralBackgroundImage(backgroundImage)
    }
    
    func showGeneralBackgroundCloudImage() {
        let backgroundCloudImage = self.model.generalBackgroundCloud
        self.view?.setGeneralBackgroundCloudImage(backgroundCloudImage)
    }
    
    func showSyllablesBoyImage() {
        let syllablesBoyImage = self.model.syllablesBoy
        self.view?.setSyllablesBoyImage(syllablesBoyImage)
    }
    
    func showAdditionAndSubtractionGirlImage() {
        let additionAndSubtractionGirlImage = self.model.additionAndSubtractionGirl
        self.view?.setAdditionAndSubtractionGirlImage(additionAndSubtractionGirlImage)
    }
    
    func showNumbersImage() {
        let numbersImage = self.model.numbers
        self.view?.setNumbersImage(numbersImage)
    }
    
    func showAlphabetImage() {
        let alphabetImage = self.model.alphabet
        self.view?.setAlphabetImage(alphabetImage)
    }
    
    func showSyllablesTextImage() {
        let syllablesTextImage = self.model.syllablesText
        self.view?.setSyllablesTextImage(syllablesTextImage)
    }
    
    func showAdditionAndSubtractionTextImage() {
        let additionAndSubtractionTextImage = self.model.additionAndSubtractionText
        self.view?.setAdditionAndSubtractionTextImage(additionAndSubtractionTextImage)
    }
    
    func showNumbersTextImage() {
        let numbersTextImage = self.model.numbersText
        self.view?.setNumbersTextImage(numbersTextImage)
    }
    
    func showAlphabetTextImage() {
        let alphabetTextImage = self.model.alphabetText
        self.view?.setAlphabetTextImage(alphabetTextImage)
    }
    
    func showCloud1Image() {
        let cloud1 = self.model.cloud1
        self.view?.setCloud1Image(cloud1)
    }
    
    func showCloud2Image() {
        let cloud2 = self.model.cloud2
        self.view?.setCloud2Image(cloud2)
    }
    
    func showCloud3Image() {
        let cloud3 = self.model.cloud3
        self.view?.setCloud3Image(cloud3)
    }
    
    func showCloud4Image() {
        let cloud4 = self.model.cloud4
        self.view?.setCloud4Image(cloud4)
    }
    
    func showCloud5Image() {
        let cloud5 = self.model.cloud5
        self.view?.setCloud5Image(cloud5)
    }
    
    func showCloud6Image() {
        let cloud6 = self.model.cloud6
        self.view?.setCloud6Image(cloud6)
    }
    
    func showCloud7Image() {
        let cloud7 = self.model.cloud7
        self.view?.setCloud7Image(cloud7)
    }
    
    func tapOnTheAlphabetCategory(){
        router.showABCCategoryModule()
    }
    
    func tapOnTheNumbersCategory(){
        router.showNumbersCategoryModule()
    }
    
    func tapOnTheReadSyllablesCategory(){
        router.showReadSyllablesCategoryModule()
    }
    
    func tapOnTheAdditionAndSubtractionCategory(){
        router.showAdditionAndSubtractionCategoryModule()
    }
    
    func playChooseGameSound() {
        let name = CHOOSE_GAME_SOUND_NAME
        Timer.scheduledTimer(withTimeInterval: CHOOSE_GAME_TIME_INTERVAL, repeats: false) { [weak self]_ in
            guard let self = self else { return }
            self.playSomeSound(soundName: name, soundType: SOUND_TYPE)
        }
    }
    
    func playContentLock() {
        let name = CONTENT_LOCK_SOUND_NAME
        playSomeSound(soundName: name, soundType: SOUND_TYPE)
    }
    
    // MARK: Private func
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"AllCategoriesPresenter\"")
        }
    }
    
}
