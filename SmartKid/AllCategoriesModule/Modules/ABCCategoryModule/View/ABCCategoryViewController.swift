//
//  AlphabetCategoryViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 04/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

class ABCCategoryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var backgroundAlphabetImage: UIImageView!
    @IBOutlet weak var iCarouselView: iCarousel!
    
    // MARK: - Private property
    private var viewWithElements: UIView!
    private var factAnimalButton: UIButton!
    private var letterButton: UIButton!
    private var pictureImage: UIImageView!
    
    // MARK: - Internal property
    internal var abcCategoryPresenter: ABCCategoryViewPresenterProtocol!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAlphabetBackground()
        
        iCarouselView.delegate = self
        iCarouselView.dataSource = self
        iCarouselView.type = .cylinder
        
        setNavigationBarButtonItem()
    }
    
    deinit {
        print("deinit ABCCategoryViewController")
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private func
    private func setNavigationBarButtonItem(){
        self.navigationItem.hidesBackButton = true
        guard let imageBackFinger = UIImage(named: BACK_FINGET_IMAGE_NAME) else { return }
        let backFingerButton = UIBarButtonItem(image: imageBackFinger.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handlerBack(sender:)))
        self.navigationItem.leftBarButtonItem = backFingerButton
    }
    
    private func showAlphabetBackground(){
        abcCategoryPresenter.showBackgroundABC()
    }
  
    
    private func addTagsToObgects(currentIndex: Int){
        self.letterButton.tag = currentIndex
        self.factAnimalButton.tag = currentIndex
        self.pictureImage.tag = currentIndex
    }
    
    private func addTargets(){
        self.letterButton.addTarget(self,
                                    action: #selector(handlerLetterButtonPressed(sender:)),
                                    for: .touchUpInside)
        self.factAnimalButton.addTarget(self,
                                        action: #selector(handlerFactAnimalButtonPressed(sender:)),
                                        for: .touchUpInside)
    }
    
    private func addCustomTapGestureRecognize(currentIndex: Int){
        let tapToPicture = CustomTapGestureRecognizeABC(target: self,
                                                        action: #selector(handlerTapToPicture(sender:)))
        tapToPicture.pictureSoundName = abcCategoryPresenter.arrayABCStructure[currentIndex].pictureSoundName
        tapToPicture.pictureImageView = pictureImage
        tapToPicture.currentTag = currentIndex
        viewWithElements.addGestureRecognizer(tapToPicture)
    }
    
    private func addSubviewsToView(){
        viewWithElements.addSubview(pictureImage)
        viewWithElements.addSubview(letterButton)
        viewWithElements.addSubview(factAnimalButton)
    }
}

// MARK: - Extension AlphabetCategoryViewProtocol
extension ABCCategoryViewController: ABCCategoryViewProtocol{
    func setLetterView(_ button: UIButton){
        self.letterButton = button
    }
    
    func setFactAnimalView(_ button: UIButton){
        self.factAnimalButton = button
    }
    
    func setPictureView(_ imageView: UIImageView) {
        self.pictureImage = imageView
    }
    
    
    func setFirstView(_ view: UIView){
        self.viewWithElements = view
    }
    
    func setPictureImage(_ imageView: UIImageView){
        self.pictureImage = imageView
    }
    
    
    func setBackgroundABCCategoryImage(_ image: UIImage) {
        backgroundAlphabetImage.image = image
    }
    
   
    func setViewWithElementsBacgroundColor(_ color: UIColor) {
        self.viewWithElements.backgroundColor = color
    }
    
    func setFactAnimalButtonImage(_ image: UIImage){
        self.factAnimalButton.setBackgroundImage(image, for: .normal)
    }
    
    func setLetterButtonImage(_ image: UIImage){
        self.letterButton.setBackgroundImage(image, for: .normal)
    }
    
    func setPictureImage(_ image: UIImage){
        self.pictureImage.image = image
    }
    
}

// MARK: - Extension iCarousel
extension ABCCategoryViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return abcCategoryPresenter.arrayABCStructure.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        if view == nil{
            abcCategoryPresenter.showFirstView()
            abcCategoryPresenter.showPictureView()
            abcCategoryPresenter.showFactAnimalView()
            abcCategoryPresenter.showLetterView()
            
            abcCategoryPresenter.showViewWithElementsBacgroundColor()
            
            abcCategoryPresenter.showFactAnimalButtonImage(index)
            abcCategoryPresenter.showLetterButtonImage(index)
            abcCategoryPresenter.showPictureImage(index)
            
            
            addTagsToObgects(currentIndex: index)
            
            addTargets()
            
            addCustomTapGestureRecognize(currentIndex: index)
            
            addSubviewsToView()
            
            if index == 0 {
                abcCategoryPresenter.playCurrentLetterSound(index)
            }
            
            
            
        }else{
            viewWithElements = view
        }
        return viewWithElements
    }
    
    func carouselItemWidth(_ carousel: iCarousel) -> CGFloat {
        return abcCategoryPresenter.showCarouselItemWidth()
    }
    
    func carouselDidEndDecelerating(_ carousel: iCarousel) {
        let currentIndex = carousel.currentItemIndex
        abcCategoryPresenter.playCurrentLetterSound(currentIndex)
    }
    
    func carouselDidEndDragging(_ carousel: iCarousel, willDecelerate decelerate: Bool) {
        if !decelerate{
            let currentIndex = carousel.currentItemIndex
            abcCategoryPresenter.playCurrentLetterSound(currentIndex)
        }
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        if carousel.currentItemIndex != index{
            abcCategoryPresenter.playCurrentLetterSound(index)
        }
    }
    
    // MARK: - Handlers
    @objc func handlerFactAnimalButtonPressed(sender: UIButton){
        let currentTag = sender.tag
        pulsateView(sender)
        abcCategoryPresenter.tapOnTheLightBulb(currentTag)
    }
    
    @objc func handlerLetterButtonPressed(sender: UIButton){
        let currentTag = sender.tag
        pulsateView(sender)
        abcCategoryPresenter.tapOnTheLetter(currentTag)
    }
    
    @objc func handlerTapToPicture(sender: CustomTapGestureRecognizeABC){
        guard let soundName = sender.pictureSoundName else { return }
        guard let currentTag = sender.currentTag else { return }
        
        abcCategoryPresenter.tapOnThePicture(soundName, currentTag)
        turnLefrAndRightAnimation(view: sender.pictureImageView, rotateFrom: ROTATE_ZERO, rotateTo: ROTATE_TEN)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
            turnLefrAndRightAnimation(view: sender.pictureImageView, rotateFrom: ROTATE_ZERO, rotateTo: ROTATE_MINUS_TEN)
        }
    }
}
