//
//  NumbersPresenter.swift
//  SmartKid
//
//  Created by Fedor Losev on 04/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import AVFoundation
import UIKit

protocol SomeNumbersViewProtocol: class{
    func setBackgrounSomeNumbersImage(_ image: UIImage)
    func setSomeNumbersImage(_ image: UIImage)
    func setSomeSketchNumberImage(_ image: UIImage)
    func setSomeFingerNumberImage(_ image: UIImage)
    func setDrawingBoardImage(_ image: UIImage)
    func setClearDravingBoardBtnImage(_ image: UIImage)
    func setUndoLastLineBtnImage(_ image: UIImage)
    func setEraserColorBtnImage(_ image: UIImage)
    func setStrokeWidth20pxBtnImage(_ image: UIImage)
    func setStrokeWidth25pxBtnImage(_ image: UIImage)
    func setStrokeWidth30pxBtnImage(_ image: UIImage)
    func setBlueBtnImage(_ image: UIImage)
    func setRedBtnImage(_ image: UIImage)
    func setGreenBtnImage(_ image: UIImage)
    func setYellowBtnImage(_ image: UIImage)
    
    func setPreviousNumber(_ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage], _ arrayFingerNumberImage: [UIImage]) -> Int
    func setSecondNumber(_ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage], _ arrayFingerNumberImage:[UIImage]) -> Int
    
    func setPreviousBtnImage(_ image: UIImage)
    func setForwardBtnImage(_ image: UIImage)
}

protocol SomeNumbersViewPresenterProtocol: class{
    init(_ view: SomeNumbersViewProtocol, _ model: SomeNumbersModel)
    
    func showBackgrounSomeNumbersImage()
    func showSomeNumbersImage()
    func showSomeSketchNumberImage()
    func showSomeFingerNumberImage()
    func showPreviousBtnImage()
    func showForwardBtnImage()
    
    func showDrawingBoardImage()
    func showClearDravingBoardBtnImage()
    func showUndoLastLineBtnImage()
    func showEraserColorBtnImage()
    func showStrokeWidth20pxBtnImage()
    func showStrokeWidth25pxBtnImage()
    func showStrokeWidth30pxBtnImage()
    func showBlueBtnImage()
    func showRedBtnImage()
    func showGreenBtnImage()
    func showYellowBtnImage()
    
    func showRotateAnimation(imageView: UIImageView)
    func showPreviousNumber()
    func showSecondNumber()
    
    func getPreviousIndex() -> Int
    func getForvardIndex() -> Int
    
    func playCurrentSoundOpenedNumber()
    func playFingerSound()
    func playNumberSound()
    func playInstrumentSound(soundName:String)
}

class SomeNumbersPresenter: SomeNumbersViewPresenterProtocol{
    
    // MARK: - Private property
    private weak var view: SomeNumbersViewProtocol?
    private var model: SomeNumbersModel
    
    private var audioPlayer: AVAudioPlayer!
    
    private var arrayNumberImages = [UIImage]()
    private var arraySketchImages = [UIImage]()
    private var arrayPictureFingerImages = [UIImage]()
    private var arrayBackBtnImages = [UIImage]()
    private var arrayForwardBtnImages = [UIImage]()
    
    private var arraySoundDrawNumber = [String]()
    private var arraySoundFingers = [String]()
    private var arraySoundNumber = [String]()
    
    // MARK: - Required init
    required init(_ view: SomeNumbersViewProtocol, _ model: SomeNumbersModel) {
        self.view = view
        self.model = model
        
        getArrayNumberImages()
        getArraySketchNumbers()
        getArrayPictureFingers()
        getArrayBackBtnImages()
        getArrayForwardBtnImages()
        getArraySoundDrawNumber()
        getArraySoundFingers()
        getArraySoundNumbers()
    }
    
    // MARK: - Private func
    private func getArrayNumberImages(){
        guard let path = Bundle.main.path(forResource: NUMBER_IMAGES_NAME_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            guard let image = UIImage(named: item as! String) else { return }
            self.arrayNumberImages.append(image)
        }
    }
    
    private func getArraySketchNumbers(){
        guard let path = Bundle.main.path(forResource: SKETCH_NUMBER_NAME_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            guard let image = UIImage(named: item as! String) else { return }
            self.arraySketchImages.append(image)
        }
    }
    
    private func getArrayPictureFingers(){
        guard let path = Bundle.main.path(forResource: PICTURE_FINGERS_NAME_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            guard let image = UIImage(named: item as! String) else { return }
            self.arrayPictureFingerImages.append(image)
        }
    }
    
    private func getArrayBackBtnImages(){
        guard let path = Bundle.main.path(forResource: BACK_BTN_NAME_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            guard let image = UIImage(named: item as! String) else { return }
            self.arrayBackBtnImages.append(image)
        }
    }
    
    private func getArrayForwardBtnImages(){
        guard let path = Bundle.main.path(forResource: FORWARD_BTN_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            guard let image = UIImage(named: item as! String) else { return }
            self.arrayForwardBtnImages.append(image)
        }
    }
    
    private func getArraySoundFingers(){
        guard let path = Bundle.main.path(forResource: SOUND_FINGER_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            self.arraySoundFingers.append(item as! String)
        }
    }
    
    private func getArraySoundDrawNumber(){
        guard let path = Bundle.main.path(forResource: SOUND_DRAW_NUMBER_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            self.arraySoundDrawNumber.append(item as! String)
        }
    }
    
    private func getArraySoundNumbers(){
        guard let path = Bundle.main.path(forResource: SOUND_NUMBER_PLIST, ofType: PLIST) else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        for item in array{
            self.arraySoundNumber.append(item as! String)
        }
    }
    
    private func playSomeSound(soundName: String, soundType: String){
        guard let pathToSound = Bundle.main.path(forResource: soundName, ofType: soundType) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error play audio in the \"SomeNumberModule\"")
        }
    }
    
    // MARK: - Internal func
    func playCurrentSoundOpenedNumber(){
        let currentIndex = self.model.currentIndexNumber
        let currentNumberSound = arraySoundDrawNumber[currentIndex]
        Timer.scheduledTimer(withTimeInterval: DURATION_TRAY_TO_WRATE_NUMBER_INTO_BOUAR, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.playSomeSound(soundName: currentNumberSound, soundType: SOUND_TYPE)
        }
        
    }
    
    func playNumberSound(){
        let currentIndex = self.model.currentIndexNumber
        let currentNumberSound = arraySoundNumber[currentIndex]
        playSomeSound(soundName: currentNumberSound, soundType: SOUND_TYPE)
    }
    
    func playFingerSound(){
        let currentIndex = self.model.currentIndexNumber
        let currentFingerSound = arraySoundFingers[currentIndex]
        playSomeSound(soundName: currentFingerSound, soundType: SOUND_TYPE)
    }
    
    func playInstrumentSound(soundName:String){
        playSomeSound(soundName: soundName, soundType: SOUND_TYPE)
    }
    
    func getPreviousIndex() -> Int{
        let currentIndex = self.model.currentIndexNumber
        var previousIndex = currentIndex - NUMBER_ONE
        
        if previousIndex < NUMBER_ZERO {
            previousIndex = NUMBER_NINE
        }
        return previousIndex
    }
    
    func getForvardIndex() -> Int {
        let currentIndex = self.model.currentIndexNumber
        var forwardIndex = currentIndex + NUMBER_ONE
        
        if forwardIndex > NUMBER_NINE {
            forwardIndex = NUMBER_ZERO
        }
        return forwardIndex
    }
    
    func showPreviousBtnImage(){
        let previousIndex = getPreviousIndex()
        let previouseBtnImage = arrayBackBtnImages[previousIndex]
        self.view?.setPreviousBtnImage(previouseBtnImage)
        
    }
    
    func showForwardBtnImage(){
        let forwardIndex = getForvardIndex()
        let forwardBtnImage = arrayForwardBtnImages[forwardIndex]
        self.view?.setForwardBtnImage(forwardBtnImage)
    }
    
    func showBackgrounSomeNumbersImage() {
        let backgrounSomeNumbersImage = self.model.backgrounNumbersImage
        self.view?.setBackgrounSomeNumbersImage(backgrounSomeNumbersImage)
    }
    
    func showSomeNumbersImage(){
        let currentIndex = self.model.currentIndexNumber
        let numberImage = arrayNumberImages[currentIndex]
        self.view?.setSomeNumbersImage(numberImage)
    }
    
    func showSomeSketchNumberImage(){
        let currentIndex = self.model.currentIndexNumber
        let sketchImage = arraySketchImages[currentIndex]
        self.view?.setSomeSketchNumberImage(sketchImage)
    }
    
    func showSomeFingerNumberImage(){
        let currentIndex = self.model.currentIndexNumber
        let pictureImage = arrayPictureFingerImages[currentIndex]
        self.view?.setSomeFingerNumberImage(pictureImage)
    }
    
    func showPreviousNumber(){
        let arrayNumbersImages = arrayNumberImages
        let arraySkethNubersImages = arraySketchImages
        let arrayFingerNumberImage = arrayPictureFingerImages
        
        guard let newIndexSomeNumber = self.view?.setPreviousNumber(arrayNumbersImages,
                                                                    arraySkethNubersImages,
                                                                    arrayFingerNumberImage) else { return }
        self.model.currentIndexNumber = newIndexSomeNumber
        
        let previousIndex = getPreviousIndex()
        let previousBtnImage = arrayBackBtnImages[previousIndex]
        
        let forwardIndex = getForvardIndex()
        let forwardBtnImage = arrayForwardBtnImages[forwardIndex]
        
        self.view?.setPreviousBtnImage(previousBtnImage)
        self.view?.setForwardBtnImage(forwardBtnImage)
    }
    
    func showSecondNumber(){
        let arrayNumbersImages = arrayNumberImages
        let arraySkethNubersImages = arraySketchImages
        let arrayFingerNumberImage = arrayPictureFingerImages
        
        guard let newIndexSomeNumber = self.view?.setSecondNumber(arrayNumbersImages,
                                                                  arraySkethNubersImages,
                                                                  arrayFingerNumberImage) else { return }
        self.model.currentIndexNumber = newIndexSomeNumber
        
        let previousIndex = getPreviousIndex()
        let previousBtnImage = arrayBackBtnImages[previousIndex]
        
        let forwardIndex = getForvardIndex()
        let forwardBtnImage = arrayForwardBtnImages[forwardIndex]
        
        self.view?.setPreviousBtnImage(previousBtnImage)
        self.view?.setForwardBtnImage(forwardBtnImage)
    }
    
    func showDrawingBoardImage(){
        let drawingBoardImage = self.model.dravingBoardImage
        self.view?.setDrawingBoardImage(drawingBoardImage)
    }
    
    func showClearDravingBoardBtnImage(){
        let clearDravingBoardBtnImage = self.model.clearDravingBoardBtnImage
        self.view?.setClearDravingBoardBtnImage(clearDravingBoardBtnImage)
    }
    
    func showUndoLastLineBtnImage(){
        let undoLastLineBtnImage = self.model.undoLastLineBtnImage
        self.view?.setUndoLastLineBtnImage(undoLastLineBtnImage)
    }
    
    func showEraserColorBtnImage(){
        let eraserColorBtnImage = self.model.eraserColorBtnImage
        self.view?.setEraserColorBtnImage(eraserColorBtnImage)
    }
    
    func showStrokeWidth20pxBtnImage(){
        let strokeWidth20pxBtnImage = self.model.strokeWidth20pxBtnImage
        self.view?.setStrokeWidth20pxBtnImage(strokeWidth20pxBtnImage)
    }
    
    func showStrokeWidth25pxBtnImage(){
        let strokeWidth25pxBtnImage = self.model.strokeWidth25pxBtnImage
        self.view?.setStrokeWidth25pxBtnImage(strokeWidth25pxBtnImage)
    }
    
    func showStrokeWidth30pxBtnImage(){
        let strokeWidth30pxBtnImage = self.model.strokeWidth30pxBtnImage
        self.view?.setStrokeWidth30pxBtnImage(strokeWidth30pxBtnImage)
    }
    
    func showBlueBtnImage(){
        let blueBtnImage = self.model.blueBtnImage
        self.view?.setBlueBtnImage(blueBtnImage)
    }
    
    func showRedBtnImage(){
        let redBtnImage = self.model.redBtnImage
        self.view?.setRedBtnImage(redBtnImage)
    }
    
    func showGreenBtnImage(){
        let greenBtnImage = self.model.greenBtnImage
        self.view?.setGreenBtnImage(greenBtnImage)
    }
    
    func showYellowBtnImage(){
        let yellowBtnImage = self.model.yellowBtnImage
        self.view?.setYellowBtnImage(yellowBtnImage)
    }
    
    func showRotateAnimation(imageView: UIImageView){
        turnLefrAndRightAnimation(view: imageView, rotateFrom: SOME_NUMBER_ROTATE_ZERO, rotateTo: SOME_NUMBER_ROTATE_FIVE)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
            turnLefrAndRightAnimation(view: imageView, rotateFrom: ROTATE_ZERO, rotateTo: ROTATE_MINUS_TEN)
        }
    }
}
