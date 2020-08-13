//
//  AditionAndSubtractionPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 23/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

protocol AdditionAndSubtractionViewProtocol: class{
    
    func setGeneralBackground(_ image: UIImage)
    
    func setFirstPictureImage(_ image: UIImage)
    func setCharacterPictureImage(_ image: UIImage)
    func setSecondPictureImage(_ image: UIImage)
    func setEqualPictureImage(_ image: UIImage)
    func setAnswerPictureImage(_ image: UIImage)
    func setAnswerNumberImage(_ image: UIImage)
    func setFirstBackgroundNumberImage(_ image: UIImage)
    func setFirstNumberVariantAnswer(_ image: UIImage)
    func setSecondBackgroundNumberImage(_ image: UIImage)
    func setSecondNumberVariantAnswer(_ image: UIImage)
    func setThirdBackgroundNumberImage(_ image: UIImage)
    func setThirdNumberVariantAnswer(_ image: UIImage)
    
    func setNextExampleImage(_ image: UIImage)
    func setFirstBtnNumberImage(_ image: UIImage)
    func setSecondBtnNumberImage(_ image: UIImage)
}

protocol AdditionAndSubtractionViewPresenterProtocol: class {
    init (view:AdditionAndSubtractionViewProtocol, model:AdditionAndSubtractionModel )
    
    func showGeneralBackground()
    
    func showFirstPictureImage()
    func showCharacterPictureImage()
    func showSecondPictureImage()
    func showEqualPictureImage()
    func showAnswerPictureImage()

    func showAnswerNumberImage()
    func showFirstBackgroundNumberImage()
    func showFirstNumberVariantAnswer()
    func showSecondBackgroundNumberImage()
    func showSecondNumberVariantAnswer()
    func showThirdBackgroundNumberImage()
    func showThirdNumberVariantAnswer()
    
    func showChangedPictureAnswerImage(image: UIImage)
    func isCorrectNumberImageView() -> Bool
    
    func showNextExampleImage()
    func showFirstBtnNumberImage()
    func showSecondBtnNumberImage()
    
    func generateNewGame()
    func forvardBtnMove(_ view: UIView, _ options: UIView.AnimationOptions, _ btn: UIButton, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat)
    
    
    func playFirstPictureSound()
    func playCharacterPictureSound()
    func playSecondPictureSound()
    func playEqualPictureSound()
    func playAnswerPictureSound()
    func playCurrentQuestion()

    func playFirstNumberSound()
    func playSecondNumberSound()
    
    func playFirstNumberVariantAnswerSound()
    func playSecondNumberVariantAnswerSound()
    func playThirdNumberVariantAnswerSound()
    
    func playFirstBackgroundNumberSound()
    func playSecondBackgroundNumberSound()
    func playThirdBackgroundNumberSound()
    
    func playWinnerSound()
    func playLoseSound()
}


enum Characters: String{
    case addition = "плюс"
    case subtraction = "минус"
}

enum tags: Int{
    case viewPictureTag1 = 1
    case viewPictureTag2 = 2
    case viewPictureTag3 = 3
}

enum indexes: Int{
    case index0 = 0
    case index1 = 1
    case index2 = 2
}

enum dictionaryKeys: String{
    case namePicture = "name"
    case nameNumber = "numbersNames"
}

class AdditionAndSubtractionPresenter: AdditionAndSubtractionViewPresenterProtocol{
    weak var view: AdditionAndSubtractionViewProtocol!
    let model: AdditionAndSubtractionModel
    
    // MARK: Private propertys
    private var dictionary: NSDictionary?
    
    private var arrayPictureObjects = [String]()
    private var arrayNumbersObjects = [String]()
    
    private var shufledArrayNumbersVarint = [String]()
    
    private var arraySoundsWinner = [String]()
    private var arraySoundsLose = [String]()
    
    private var soundCurrentCharacter: String?
    private var soundEqual: String?
    private var soundHowMuchWillPicture: String?
    private var soundImagePicture1: String?
    private var soundImagePicture2: String?
    private var soundImageNumber1: String?
    private var soundImageNumber2: String?
    
    private var correctPictureAnswer: String?
    private var correctNumberAnswer: String?
    
    private var oneFakeNumberAnswer: String?
    private var twoFakeNumberAnswer: String?
    
    private var imagePicture1: UIImage?
    private var imagePicture2: UIImage?
    private var imageNumber1: UIImage?
    private var imageNumber2: UIImage?
    
    private var newUserAnswerPictureVariantImage: UIImage?
    private var newUserAnswerNumberVariantImage: UIImage?
    
    private var currentCharacter: UIImage?
    
    private let minNumber = 0
    private var audioPlayer: AVAudioPlayer!
    
    // MARK: - init
    required init(view: AdditionAndSubtractionViewProtocol, model: AdditionAndSubtractionModel) {
        self.view = view
        self.model = model
        
        initPropertys()
        
        arraySoundsWinner = getArrayFromPlist(namePlist: WINNER_SOUND_PLIST)
        arraySoundsLose = getArrayFromPlist(namePlist: LOSE_SOUND_PLIST)
    }
    
    func initPropertys(){
        soundEqual = EQUAL_SOUND
        dictionary = getDictionaryFromModel()
        createRandomArraysWithObjectsFromDictionary()
        getArraysNumbersObjects()
        
        let arithmeticCharacter = getArithmeticCharacter()
        soundCurrentCharacter = arithmeticCharacter
        
        switchCharacter(character: arithmeticCharacter)
        
        generateRandomFakeAnswers(numbersObjects:arrayNumbersObjects)

        guard let correctNumberAnswer = correctNumberAnswer else { return }
        guard let oneFakeNumberAnswer = oneFakeNumberAnswer else { return }
        guard let twoFakeNumberAnswer = twoFakeNumberAnswer else { return }
        
        shufledArrayNumbersVarint = createShufledArray(correctNumberAnswer, oneFakeNumberAnswer, twoFakeNumberAnswer)

    }
    
    // MARK: - Shows button images
    func showNextExampleImage() {
        let nextExampleImage = self.model.nextExampleImage
        self.view.setNextExampleImage(nextExampleImage)
    }
    
    func showFirstBtnNumberImage() {
        guard let firstButtonImage = imageNumber1 else { return }
        self.view.setFirstBtnNumberImage(firstButtonImage)
    }
    
    func showSecondBtnNumberImage() {
        guard let secondButtonImage = imageNumber2 else { return }
        self.view.setSecondBtnNumberImage(secondButtonImage)
    }
    
    // MARK: - Shows new images
    func showChangedPictureAnswerImage(image: UIImage) {
        newUserAnswerPictureVariantImage = image
        guard let userAnswerImage = newUserAnswerPictureVariantImage else { return }
        self.view.setAnswerPictureImage(userAnswerImage)
    }
    
    func showChangedNuberAnswerImage(image: UIImage) {
        newUserAnswerNumberVariantImage = image
        guard let userAnswerImage = newUserAnswerNumberVariantImage else { return }
        self.view.setAnswerNumberImage(userAnswerImage)
    }
    
    // MARK: - Check correct answer
    func isCorrectNumberImageView() -> Bool{
        guard let correctNumberAnswer = correctNumberAnswer else { return false}
        let correctAnswer = UIImage(named: correctNumberAnswer)
        let answerVariant = newUserAnswerNumberVariantImage
        
        if answerVariant == correctAnswer {
            return true
        }
        return false
    }
}

// MARK: - Extension Shows numbers images
extension AdditionAndSubtractionPresenter{
    func showAnswerNumberImage() {
        let answerNumberImage = self.model.answerNumberImage
        self.view.setAnswerNumberImage(answerNumberImage)
    }
    
    func showFirstNumberVariantAnswer() {
        let stringName = shufledArrayNumbersVarint[indexes.index0.rawValue]
        guard let firstNumberVariant = UIImage(named: stringName) else { return }
        self.view.setFirstNumberVariantAnswer(firstNumberVariant)
    }
    
    func showSecondNumberVariantAnswer() {
        let stringName = shufledArrayNumbersVarint[indexes.index1.rawValue]
        guard let secondNumberVariant = UIImage(named: stringName) else { return }
        self.view.setSecondNumberVariantAnswer(secondNumberVariant)
    }
    
    func showThirdNumberVariantAnswer() {
        let stringName = shufledArrayNumbersVarint[indexes.index2.rawValue]
        guard let thirdNumberVariant = UIImage(named: stringName) else { return }
        self.view.setThirdNumberVariantAnswer(thirdNumberVariant)
    }
    
    func showFirstBackgroundNumberImage() {
        let stringName = shufledArrayNumbersVarint[indexes.index0.rawValue]
        guard let firstBackgroundNumber = UIImage(named: stringName) else { return }
        self.view.setFirstBackgroundNumberImage(firstBackgroundNumber)
    }
    
    func showSecondBackgroundNumberImage() {
        let stringName = shufledArrayNumbersVarint[indexes.index1.rawValue]
        guard let secondBackgroundNumber = UIImage(named: stringName) else { return }
        self.view.setSecondBackgroundNumberImage(secondBackgroundNumber)
    }
    
    func showThirdBackgroundNumberImage() {
        let stringName = shufledArrayNumbersVarint[indexes.index2.rawValue]
        guard let thirdBackgroundNumber = UIImage(named: stringName) else { return }
        self.view.setThirdBackgroundNumberImage(thirdBackgroundNumber)
    }
}

// MARK: - Extension Shows picture images
extension AdditionAndSubtractionPresenter{
    func showFirstPictureImage(){
        guard let firstPicture = self.imagePicture1 else { return }
        self.view.setFirstPictureImage(firstPicture)
    }
    
    func showCharacterPictureImage(){
        guard let currentCharacter = self.currentCharacter else { return }
        self.view.setCharacterPictureImage(currentCharacter)
    }
    
    func showSecondPictureImage(){
        guard let secondPicture = self.imagePicture2 else { return }
        self.view.setSecondPictureImage(secondPicture)
    }
    
    func showEqualPictureImage() {
        let equalPictureImage = self.model.equalImage
        self.view.setEqualPictureImage(equalPictureImage)
    }
    
    func showAnswerPictureImage() {
        guard let sntringAnswerName = self.correctPictureAnswer else { return }
        guard let answerImage = UIImage(named: sntringAnswerName) else { return }
        self.view.setAnswerPictureImage(answerImage)
    }
}

// MARK: - Extension Generate new game
extension AdditionAndSubtractionPresenter{
    func generateNewGame(){
        clearAllStoredProperty()
        initPropertys()
    }
}

// MARK: - Extension Shows background images
extension AdditionAndSubtractionPresenter{
    func showGeneralBackground() {
        let generalBackground = self.model.generalBackground
        self.view.setGeneralBackground(generalBackground)
    }
}

// MARK: - Extension Private func
extension AdditionAndSubtractionPresenter{
    
    private func getRandomWinnerSound() -> String{
        guard let winnerSounnd = arraySoundsWinner.randomElement()  else { return "nil winner sound"}
        return winnerSounnd
    }
    
    private func getRandomLoseSound() -> String{
        guard let loseSounnd = arraySoundsLose.randomElement() else { return "nil lose sound"}
        return loseSounnd
    }
    
    private func getArrayFromPlist(namePlist: String) -> [String]{
        let pathString = Bundle.main.path(forResource: namePlist, ofType: PLIST)
        let array = NSArray(contentsOfFile: pathString!) as? [String]
        return array!
    }
    
    private func clearAllStoredProperty(){
        arrayPictureObjects.removeAll()
        arrayNumbersObjects.removeAll()
        shufledArrayNumbersVarint.removeAll()
        
        soundEqual = nil
        soundImagePicture1 = nil
        soundImagePicture2 = nil
        soundImageNumber1 = nil
        soundImageNumber2 = nil
        soundCurrentCharacter = nil
        
        dictionary = nil
        correctPictureAnswer = nil
        correctNumberAnswer = nil
        oneFakeNumberAnswer = nil
        twoFakeNumberAnswer = nil
        imagePicture1 = nil
        imagePicture2 = nil
        imageNumber1 = nil
        imageNumber2 = nil
        newUserAnswerPictureVariantImage = nil
        newUserAnswerNumberVariantImage = nil
        currentCharacter = nil

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
    
    private func createShufledArray(_ answer: String, _ oneFake: String, _ twoFake: String) -> [String]{
        let shufledArray = [answer, oneFake, twoFake].shuffled()
        return shufledArray
    }
    
    private func generateRandomFakeAnswers(numbersObjects:[String]){
        let randomIndex1 = Int(arc4random_uniform(UInt32(numbersObjects.count)))
        let randomIndex2 = Int(arc4random_uniform(UInt32(numbersObjects.count)))
 
        oneFakeNumberAnswer = numbersObjects[randomIndex1]
        twoFakeNumberAnswer = numbersObjects[randomIndex2]
        
        if oneFakeNumberAnswer == correctNumberAnswer || twoFakeNumberAnswer == correctNumberAnswer{
            generateRandomFakeAnswers(numbersObjects: numbersObjects)
        }
        
        if oneFakeNumberAnswer == twoFakeNumberAnswer {
            generateRandomFakeAnswers(numbersObjects: numbersObjects)
        }
    }
    
    private func getArraysNumbersObjects(){
        guard let pathToPlist = Bundle.main.path(forResource: AS_NUMBERS_PLIST, ofType: PLIST) else { return }
        let dict = NSDictionary(contentsOfFile: pathToPlist)!
        
        guard let arrayObjects = dict[dictionaryKeys.nameNumber.rawValue] as? [String] else { return }        
        arrayNumbersObjects = arrayObjects
    }
    
    private func switchCharacter(character: String){
        switch character{
        case Characters.addition.rawValue:
            currentCharacter = #imageLiteral(resourceName: "плюс")
            let correctExample = getCorrectAdditionObjects(obj:arrayPictureObjects)
            calculateCurrentParams(pictureObjects: arrayPictureObjects,
                                   numbersObjects: arrayNumbersObjects,
                                   params: correctExample)
            
        case Characters.subtraction.rawValue:
            currentCharacter = #imageLiteral(resourceName: "минус")
            let correctExample = getCorrectSubtractionNumbers(obj:arrayPictureObjects)
            calculateCurrentParams(pictureObjects: arrayPictureObjects,
                                   numbersObjects: arrayNumbersObjects,
                                   params: correctExample)
        default:
            print(NO_CHARACTERS)
        }
    }
    
    private func calculateCurrentParams(pictureObjects:[String],
                                        numbersObjects:[String],
                                        params: [Int]){
        imagePicture1 = UIImage(named: pictureObjects[params[indexes.index0.rawValue]])!
        imagePicture2 = UIImage(named: pictureObjects[params[indexes.index1.rawValue]])!
        soundImagePicture1 = pictureObjects[params[indexes.index0.rawValue]]
        soundImagePicture2 = pictureObjects[params[indexes.index1.rawValue]]
        
        soundHowMuchWillPicture = HOW_MUCH_WILL_SOUND_IMAGE
        
        imageNumber1 = UIImage(named: numbersObjects[params[indexes.index0.rawValue]])!
        imageNumber2 = UIImage(named: numbersObjects[params[indexes.index1.rawValue]])!
        soundImageNumber1 = numbersObjects[params[indexes.index0.rawValue]]
        soundImageNumber2 = numbersObjects[params[indexes.index1.rawValue]]
        
        correctPictureAnswer = pictureObjects[params[indexes.index2.rawValue]]
        correctNumberAnswer = numbersObjects[params[indexes.index2.rawValue]]
    }
    
    private func getCorrectSubtractionNumbers(obj: [String]) -> [Int]{
        let randomIndex1 = getRandomIndex(obj)
        let randomIndex2 = getRandomIndex(obj)
        
        let number1 = randomIndex1
        let number2 = randomIndex2
        let subtractionNumber = number1 - number2
        
        var correctNumbers = [Int]()
        
        if subtractionNumber < minNumber{
            correctNumbers = getCorrectSubtractionNumbers(obj: obj)
            return correctNumbers
        }else{
            correctNumbers.append(number1)
            correctNumbers.append(number2)
            correctNumbers.append(subtractionNumber)
            return correctNumbers
        }
    }
    
    private func getCorrectAdditionObjects(obj: [String]) -> [Int]{
        let randomIndex1 = getRandomIndex(obj)
        let randomIndex2 = getRandomIndex(obj)
        let additionIndex = randomIndex1 + randomIndex2
        
        let number1 = randomIndex1
        let number2 = randomIndex2
        let answerNumbers = additionIndex
        
        var correctExample = [Int]()
        
        if additionIndex > obj.count-1{
            correctExample = getCorrectAdditionObjects(obj: obj)
            return correctExample
        }else{
            correctExample.append(number1)
            correctExample.append(number2)
            correctExample.append(answerNumbers)
            return correctExample
        }
    }
    
    private func getRandomIndex(_ object: [String]) -> Int{
        let randomIndex = Int(arc4random_uniform(UInt32(object.count)))
        return randomIndex
    }
    
    private func getArithmeticCharacter() -> String{
        guard let pathToPlist = Bundle.main.path(forResource: ARITHMETIC_CHARACTERS, ofType: PLIST)
            else { return NOT_FIND_ARITHMETIC_CHARACTERS_PLIST }
        
        let array = NSArray(contentsOfFile: pathToPlist) as? Array<String>
        let randomCharacter = array?.randomElement()
        guard let character = randomCharacter else { return NIL_CHARACTER}
        return character
    }
    
    private func getDictionaryFromModel() -> NSDictionary{
        let nsDictionary = self.model.dictionaryAditionAndSubtraction
        return nsDictionary
    }
    
    private func createRandomArraysWithObjectsFromDictionary(){
        let dict = dictionary as! [String: Any]
        let randomKeyName = dict.keys.randomElement()!
        let dictionaryByKey = dict[randomKeyName] as! [String: Any]
        
        let arrayObjects = dictionaryByKey[dictionaryKeys.namePicture.rawValue] as! [String]
        arrayPictureObjects = arrayObjects
    }
    
    private func romoveCurrentSavedArithmeticResultSoundFileIfNeeded(){
        let filemanager = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first! as NSString
        
        let destinationPath = documentsPath.appendingPathComponent(NEW_CONCATINATE_SOUND_FILE_NAME)
        do{
            try filemanager.removeItem(atPath: destinationPath)
        }catch{
            print("cannot find file for remove: \"AdditionAndSubtractionPresenter\"")
        }
    }
    
    private func playNewConcatinateFileInDirectory(soundOne: String, soundTwo: String, soundThree: String, soundFour: String){
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
        let fileDestinationUrl = documentDirectoryURL.appendingPathComponent(NEW_CONCATINATE_SOUND_FILE_NAME)
        
        let composition = AVMutableComposition()
        guard let compositionAudioTrack = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid) else { return }
        
        guard let soundOne = Bundle.main.path(forResource: soundOne, ofType: SOUND_TYPE) else { return }
        guard let soundTwo = Bundle.main.path(forResource: soundTwo, ofType: SOUND_TYPE) else { return }
        guard let soundThree = Bundle.main.path(forResource: soundThree, ofType: SOUND_TYPE) else { return }
        guard let soundFour = Bundle.main.path(forResource: soundFour, ofType: SOUND_TYPE) else { return }
        
        let urlSoundOne = URL(fileURLWithPath: soundOne)
        let urlSoundTwo = URL(fileURLWithPath: soundTwo)
        let urlSoundThree = URL(fileURLWithPath: soundThree)
        let urlSoundFour = URL(fileURLWithPath: soundFour)
        
        
        compositionAudioTrack.append(url: urlSoundOne)
        compositionAudioTrack.append(url: urlSoundTwo)
        compositionAudioTrack.append(url: urlSoundThree)
        compositionAudioTrack.append(url: urlSoundFour)
        
        if let assetExport = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetAppleM4A) {
            assetExport.outputFileType = AVFileType.m4a
            assetExport.outputURL = fileDestinationUrl
            assetExport.exportAsynchronously(completionHandler: {
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOf: fileDestinationUrl)
                    self.audioPlayer!.play()
                }catch{
                    print("error play audio in the \"ReadSyllablesPresenter\"")
                }
            })
        }
    }
    
}

// MARK: - Extension Animations
extension AdditionAndSubtractionPresenter{
    func forvardBtnMove(_ view: UIView, _ options: UIView.AnimationOptions, _ btn: UIButton, _ duration: TimeInterval, _ delay: TimeInterval, _ moveByX: CGFloat) {
        let currentFrame = btn.frame
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            var btnFrame = btn.frame
            btnFrame.origin.x -= moveByX
            btn.frame = btnFrame
        },  completion: { _ in
            btn.frame = currentFrame
        })
    }
}

// MARK: - Extension Play Sounds
extension AdditionAndSubtractionPresenter{
    
    func playWinnerSound() {
        let winnerString = getRandomWinnerSound()
        playSomeSound(soundName: winnerString, soundType: SOUND_TYPE)
    }
    
    func playLoseSound() {
       let loseString = getRandomLoseSound()
        playSomeSound(soundName: loseString, soundType: SOUND_TYPE)
    }
    
    func playFirstPictureSound() {
        guard let firstPictureSound = soundImagePicture1 else { return }
        playSomeSound(soundName: firstPictureSound, soundType: SOUND_TYPE)
    }
    
    func playCharacterPictureSound() {
        guard let characterPictureSound = soundCurrentCharacter else { return }
        playSomeSound(soundName: characterPictureSound, soundType: SOUND_TYPE)
    }
    
    func playSecondPictureSound() {
        guard let secondPictureSound = soundImagePicture2 else { return }
        playSomeSound(soundName: secondPictureSound, soundType: SOUND_TYPE)
    }
    
    func playEqualPictureSound() {
        guard let equalPictureSound = soundEqual else { return }
        playSomeSound(soundName: equalPictureSound, soundType: SOUND_TYPE)
    }
    
    func playAnswerPictureSound(){
        guard let answerPictureSound = correctPictureAnswer else { return }
        playSomeSound(soundName: answerPictureSound, soundType: SOUND_TYPE)
    }
    
    func playCurrentQuestion(){
        romoveCurrentSavedArithmeticResultSoundFileIfNeeded()
        
        guard let howMuchWill = soundHowMuchWillPicture else { return }
        guard let firstPictureSound = soundImagePicture1 else { return }
        guard let characterPictureSound = soundCurrentCharacter else { return }
        guard let secondPictureSound = soundImagePicture2 else { return }
        
        playNewConcatinateFileInDirectory(soundOne: howMuchWill, soundTwo: firstPictureSound, soundThree: characterPictureSound, soundFour: secondPictureSound)
    }
    
    func playFirstNumberSound() {
        guard let firstNumberSound = soundImageNumber1 else { return }
        playSomeSound(soundName: firstNumberSound, soundType: SOUND_TYPE)
    }
    
    func playSecondNumberSound() {
        guard let secondNumberSound = soundImageNumber2 else { return }
        playSomeSound(soundName: secondNumberSound, soundType: SOUND_TYPE)
    }
    
    func playFirstNumberVariantAnswerSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index0.rawValue]
        let firstNumberVariantAnswerSound = stringName
        playSomeSound(soundName: firstNumberVariantAnswerSound, soundType: SOUND_TYPE)
    }
    
    func playSecondNumberVariantAnswerSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index1.rawValue]
        let secondNumberVariantAnswerSound = stringName
        playSomeSound(soundName: secondNumberVariantAnswerSound, soundType: SOUND_TYPE)
    }
    
    func playThirdNumberVariantAnswerSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index2.rawValue]
        let thirdNumberVariantAnswerSound = stringName
        playSomeSound(soundName: thirdNumberVariantAnswerSound, soundType: SOUND_TYPE)
    }
    
    func playFirstBackgroundNumberSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index0.rawValue]
        let firstBackgroundNumberSound = stringName
        playSomeSound(soundName: firstBackgroundNumberSound, soundType: SOUND_TYPE)
    }
    
    func playSecondBackgroundNumberSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index1.rawValue]
        let secondBackgroundNumberSound = stringName
        playSomeSound(soundName: secondBackgroundNumberSound, soundType: SOUND_TYPE)
    }
    
    func playThirdBackgroundNumberSound() {
        let stringName = shufledArrayNumbersVarint[indexes.index2.rawValue]
        let thirdBackgroundNumberSound = stringName
        playSomeSound(soundName: thirdBackgroundNumberSound, soundType: SOUND_TYPE)
    }
}
