//
//  SomeNumbersViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 04/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

class SomeNumbersViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var firstGeneralView: UIView!
    
    @IBOutlet weak var previousNumberBtn: UIButton!
    @IBOutlet weak var secondNumberBtn: UIButton!
    @IBOutlet weak var someFingerNumberBtn: UIButton!
    
    @IBOutlet weak var dravingBoardImage: UIImageView!
    @IBOutlet weak var clearDravingBoardBtn: UIButton!
    @IBOutlet weak var undoLastLineBtn: UIButton!
    @IBOutlet weak var eraserColorBtn: UIButton!
    
    @IBOutlet weak var strokeWidth20pxBtn: UIButton!
    @IBOutlet weak var strokeWidth25pxBtn: UIButton!
    @IBOutlet weak var strokeWidth30pxBtn: UIButton!
    
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    
    @IBOutlet weak var backgrounSomeNumbersImage: UIImageView!
    @IBOutlet weak var sketchNumberImage: UIImageView!
    @IBOutlet weak var numbersImage: UIImageView!
    
    @IBOutlet weak var dravingBoardView: SomeNumbersCanvasView!
    
    
    // MARK: - Internal property
    internal var someNumbersPresenter: SomeNumbersViewPresenterProtocol!
    
    // MARK: - Private property
    private var isFlipped: Bool = false
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setSomeNumbersImages()
        setDravingBoardCornerRadius()
        someNumbersPresenter.playCurrentSoundOpenedNumber()
        
        playWigleAnimation()
        
        let someNumberImagePressed = UITapGestureRecognizer(target: self, action: #selector(handlerTapToSomeNumber))
        numbersImage.addGestureRecognizer(someNumberImagePressed)
        numbersImage.isUserInteractionEnabled = true
        
        setNavigationBarButtonItem()
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handlerMenuBack(sender: UIBarButtonItem){
        backToAllCategories(navController: self.navigationController!)
    }
    
    // MARK: - Private func
    private func setNavigationBarButtonItem(){
        self.navigationItem.hidesBackButton = true
        guard let imageBackFinger = UIImage(named: BACK_FINGET_IMAGE_NAME) else { return }
        let backFingerButton = UIBarButtonItem(image: imageBackFinger.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handlerBack(sender:)))
        self.navigationItem.leftBarButtonItem = backFingerButton

        guard let imageBackToMenu = UIImage(named: BACK_TOMENU_IMAGE_NAME) else { return }
        let menuBackButton = UIBarButtonItem(image: imageBackToMenu.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(handlerMenuBack(sender:)))
        self.navigationItem.rightBarButtonItem = menuBackButton
    }
    
    private func playWigleAnimation(){
        Timer.scheduledTimer(withTimeInterval: DURATION_WIGLE_ANIMATION_BY_DRAWINGBOARD, repeats: false) { time in
            self.dravingBoardImage.wiggle()
        }
    }
    
    private func setSomeNumbersImages(){
        someNumbersPresenter.showBackgrounSomeNumbersImage()
        someNumbersPresenter.showSomeNumbersImage()
        someNumbersPresenter.showSomeSketchNumberImage()
        someNumbersPresenter.showSomeFingerNumberImage()
        someNumbersPresenter.showPreviousBtnImage()
        someNumbersPresenter.showForwardBtnImage()
        someNumbersPresenter.showDrawingBoardImage()
        someNumbersPresenter.showClearDravingBoardBtnImage()
        someNumbersPresenter.showUndoLastLineBtnImage()
        someNumbersPresenter.showEraserColorBtnImage()
        someNumbersPresenter.showStrokeWidth20pxBtnImage()
        someNumbersPresenter.showStrokeWidth25pxBtnImage()
        someNumbersPresenter.showStrokeWidth30pxBtnImage()
        someNumbersPresenter.showBlueBtnImage()
        someNumbersPresenter.showRedBtnImage()
        someNumbersPresenter.showGreenBtnImage()
        someNumbersPresenter.showYellowBtnImage()
        
    }
    
    private func setDravingBoardCornerRadius(){
        dravingBoardView.layer.cornerRadius = 28
        dravingBoardView.layer.masksToBounds = true
    }
    
    func addflipView(_ transitionFlip: UIView.AnimationOptions ){
        guard let firstViewFlip = isFlipped ? firstGeneralView : firstGeneralView else { return }
        guard let secondViewFlip = isFlipped ? firstGeneralView : firstGeneralView else { return }
        UIView.transition(from: firstViewFlip,
                          to: secondViewFlip,
                          duration: DURATION_TIME,
                          options: [transitionFlip, .showHideTransitionViews],
                          completion: nil)
    }
    
    // MARK: - Handlers
    @objc func handlerTapToSomeNumber(){
        someNumbersPresenter.showRotateAnimation(imageView: numbersImage)
        someNumbersPresenter.playNumberSound()
    }
    
    @objc func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Actions
    @IBAction func strokeWidth20pxBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:SMALL_POINT_SOUND_NAME)
        dravingBoardView.setStrokeWidth(width: TWENTY_PX)
    }
    
    @IBAction func strokeWidth25pxBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:MIDDLE_POINT_SOUND_NAME)
        dravingBoardView.setStrokeWidth(width: TWENTY_FIVE_PX)
    }
    
    @IBAction func strokeWidth30pxBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:BIG_POINT_SOUND_NAME)
        dravingBoardView.setStrokeWidth(width: THIRTY_PX)
    }
    
    @IBAction func undoLastLineBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:CLEAR_LINE_SOUND_NAME)
        dravingBoardView.undo()
    }
    
    @IBAction func clearDravingBoardBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:CLEAR_BOARD_SOUND_NAME)
        dravingBoardView.clearDraw()
    }
    
    @IBAction func eraserColorBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:ERASER_SOUND_NAME)
        dravingBoardView.setStrokeColor(color: .white)
    }
    
    @IBAction func blueBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:BLUE_PENCIL_SOUND_NAME)
        dravingBoardView.setStrokeColor(color: .blue)
    }
    
    @IBAction func redBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:RED_PENCIL_SOUND_NAME)
        dravingBoardView.setStrokeColor(color: .red)
    }
    
    @IBAction func greenBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:GREEN_PENCIL_SOUND_NAME)
        dravingBoardView.setStrokeColor(color: .green)
    }
    
    @IBAction func yellowBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playInstrumentSound(soundName:YELLOW_PENCIL_SOUND_NAME)
        dravingBoardView.setStrokeColor(color: .yellow)
    }
    
    @IBAction func previousNumberBtnPressed(_ sender: UIButton) {
        previousNumberBtn.wiggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + DURATION_BEFORE_ANIMATE_BUTON) { [weak self] in
            guard let self = self else { return }
            let transitionFlip = UIView.AnimationOptions.transitionCurlUp
            self.addflipView(transitionFlip)
            self.dravingBoardView.clearDraw()
            self.someNumbersPresenter.showPreviousNumber()
            self.someNumbersPresenter.playCurrentSoundOpenedNumber()
            self.playWigleAnimation()
        }
    }
    
    @IBAction func secondNumberBtnPressed(_ sender: Any) {
        secondNumberBtn.wiggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + DURATION_BEFORE_ANIMATE_BUTON) { [weak self] in
            guard let self = self else { return }
            let transitionFlip = UIView.AnimationOptions.transitionCurlDown
            self.addflipView(transitionFlip)
            self.dravingBoardView.clearDraw()
            self.someNumbersPresenter.showSecondNumber()
            self.someNumbersPresenter.playCurrentSoundOpenedNumber()
            self.playWigleAnimation()
            
        }
    }
    
    @IBAction func someFingerNumberBtnPressed(_ sender: UIButton) {
        pulsateView(sender)
        someNumbersPresenter.playFingerSound()
    }
}

// MARK: - Extension SomeNumbersViewProtocol
extension SomeNumbersViewController: SomeNumbersViewProtocol{
    
    func setBackgrounSomeNumbersImage(_ image: UIImage) {
        backgrounSomeNumbersImage.image = image
    }
    
    func setSomeNumbersImage(_ image: UIImage) {
        numbersImage.image = image
    }
    
    func setSomeSketchNumberImage(_ image: UIImage){
        sketchNumberImage.image = image
    }
    
    func setSomeFingerNumberImage(_ image: UIImage){
        someFingerNumberBtn.setImage(image, for: .normal)
    }
    
    func setPreviousNumber( _ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage], _ arrayFingerNumberImage: [UIImage]) -> Int{
        let previousIndex = someNumbersPresenter.getPreviousIndex()
        numbersImage.image = arrayNumbersImages[previousIndex]
        sketchNumberImage.image = arraySkethNubersImages[previousIndex]
        someFingerNumberBtn.setImage(arrayFingerNumberImage[previousIndex], for: .normal)
        return previousIndex
    }
    
    func setSecondNumber(_ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage],  _ arrayFingerNumberImage: [UIImage]) -> Int {
        let forwardIndex = someNumbersPresenter.getForvardIndex()
        numbersImage.image = arrayNumbersImages[forwardIndex]
        sketchNumberImage.image = arraySkethNubersImages[forwardIndex]
        someFingerNumberBtn.setImage(arrayFingerNumberImage[forwardIndex], for: .normal)
        return forwardIndex
    }
    
    func setPreviousBtnImage(_ image: UIImage) {
        self.previousNumberBtn.setImage(image, for: .normal)
    }
    
    func setForwardBtnImage(_ image: UIImage) {
        self.secondNumberBtn.setImage(image, for: .normal)
    }
    
    func setDrawingBoardImage(_ image: UIImage){
        self.dravingBoardImage.image = image
    }
    
    func setClearDravingBoardBtnImage(_ image: UIImage){
        self.clearDravingBoardBtn.setImage(image, for: .normal)
    }
    
    func setUndoLastLineBtnImage(_ image: UIImage){
        self.undoLastLineBtn.setImage(image, for: .normal)
    }
    
    func setEraserColorBtnImage(_ image: UIImage){
        self.eraserColorBtn.setImage(image, for: .normal)
    }
    
    func setStrokeWidth20pxBtnImage(_ image: UIImage){
        self.strokeWidth20pxBtn.setImage(image, for: .normal)
    }
    
    func setStrokeWidth25pxBtnImage(_ image: UIImage){
        self.strokeWidth25pxBtn.setImage(image, for: .normal)
    }
    
    func setStrokeWidth30pxBtnImage(_ image: UIImage){
        self.strokeWidth30pxBtn.setImage(image, for: .normal)
    }
    
    func setBlueBtnImage(_ image: UIImage){
        self.blueBtn.setImage(image, for: .normal)
    }
    
    func setRedBtnImage(_ image: UIImage){
        self.redBtn.setImage(image, for: .normal)
    }
    
    func setGreenBtnImage(_ image: UIImage){
        self.greenBtn.setImage(image, for: .normal)
    }
    
    func setYellowBtnImage(_ image: UIImage){
        self.yellowBtn.setImage(image, for: .normal)
    }
    
}
