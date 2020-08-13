//
//  AditionAndSubtractionViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 19/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import AVFoundation

class AdditionAndSubtractionViewController: UIViewController {
    enum tags: Int{
        case tag1 = 1
        case tag2 = 2
        case tag3 = 3
    }
    
    // MARK: - Outlets
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var generalBackground: UIImageView!
    
    @IBOutlet weak var firstPictureImage: UIImageView!
    @IBOutlet weak var characterPictureImage: UIImageView!
    @IBOutlet weak var secondPictureImage: UIImageView!
    @IBOutlet weak var equalPictureImage: UIImageView!
    @IBOutlet weak var answerPictureImage: UIImageView!
    
    @IBOutlet weak var firstBtnNumber: UIButton!
    @IBOutlet weak var secondBtnNumber: UIButton!
    
    @IBOutlet weak var answerNumberImage: UIImageView!
    @IBOutlet weak var firstBackgroundNumberImage: UIImageView!
    @IBOutlet weak var firstNumberVariantAnswer: UIImageView!
    @IBOutlet weak var secondBackgroundNumberImage: UIImageView!
    @IBOutlet weak var secondNumberVariantAnswer: UIImageView!
    @IBOutlet weak var thirdBackgroundNumberImage: UIImageView!
    @IBOutlet weak var thirdNumberVariantAnswer: UIImageView!
    
    @IBOutlet weak var viewNumber1: UIView!
    @IBOutlet weak var viewNumber2: UIView!
    @IBOutlet weak var viewNumber3: UIView!
    @IBOutlet weak var viewNumberAnswer: UIView!
    
    @IBOutlet weak var nextExampleBtn: UIButton!
    
    @IBOutlet weak var showViewGameIsOver: UIView!
    @IBOutlet weak var showViewWhatWeWillDoNext: UIView!
    
    // MARK: - Internal proterty
    internal var additionAndSubtractionPresenter: AdditionAndSubtractionPresenter!
    
    // MARK: - Private property
    private var isFlipped: Bool = false
    
    private var touchOffsetViewPicture1:CGPoint?
    private var touchOffsetViewPicture2:CGPoint?
    private var touchOffsetViewPicture3:CGPoint?
    
    private var touchOffsetViewNumber1:CGPoint?
    private var touchOffsetViewNumber2:CGPoint?
    private var touchOffsetViewNumber3:CGPoint?
    
    private var defaultViewPicture1Position:CGPoint?
    private var defaultViewPicture2Position:CGPoint?
    private var defaultViewPicture3Position:CGPoint?
    
    private var defaultViewNumber1Position:CGPoint?
    private var defaultViewNumber2Position:CGPoint?
    private var defaultViewNumber3Position:CGPoint?
    
    private var isUserWinNumber: Bool?
    
    private var isUserInteraction:Bool?
        
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableNextExampleBtn(ieEnable: false)
        
        showBackgroundImages()
        showPictireImages()
        showNumbersImages()
        showButtonPictere()
        
        setAlphaForImages()
        
        setTagsForView()
        
        userCompleteLevel(isWinNumber: false)
        isUserInteraction = true
        
        setNavigationBarButtonItem()
        
        additionAndSubtractionPresenter.playCurrentQuestion()
    }
    
    // MARK: - Deinit
    deinit {
        print(DEINIT_ADDITION_AND_SUBTRACTION_MODULE)
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
    
    private func setTagsForView(){
        viewNumber1.tag = tags.tag1.rawValue
        viewNumber2.tag = tags.tag2.rawValue
        viewNumber3.tag = tags.tag3.rawValue
    }
    
    private func setAlphaForImages(){
        self.firstBackgroundNumberImage.alpha = ALPHA_CHANNEL
        self.secondBackgroundNumberImage.alpha = ALPHA_CHANNEL
        self.thirdBackgroundNumberImage.alpha = ALPHA_CHANNEL
    }
    
    @IBAction func backToAllCategoryBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions shows images
extension AdditionAndSubtractionViewController{
    private func showBackgroundImages(){
        additionAndSubtractionPresenter.showGeneralBackground()
    }
    
    private func showPictireImages(){
        additionAndSubtractionPresenter.showFirstPictureImage()
        additionAndSubtractionPresenter.showCharacterPictureImage()
        additionAndSubtractionPresenter.showSecondPictureImage()
        additionAndSubtractionPresenter.showEqualPictureImage()
        additionAndSubtractionPresenter.showAnswerPictureImage()
    }
    
    private func showNumbersImages(){
        additionAndSubtractionPresenter.showFirstBtnNumberImage()
        additionAndSubtractionPresenter.showSecondBtnNumberImage()
        additionAndSubtractionPresenter.showAnswerNumberImage()
        additionAndSubtractionPresenter.showFirstNumberVariantAnswer()
        additionAndSubtractionPresenter.showSecondNumberVariantAnswer()
        additionAndSubtractionPresenter.showThirdNumberVariantAnswer()
        additionAndSubtractionPresenter.showFirstBackgroundNumberImage()
        additionAndSubtractionPresenter.showSecondBackgroundNumberImage()
        additionAndSubtractionPresenter.showThirdBackgroundNumberImage()
        
    }
    
    private func showButtonPictere(){
        additionAndSubtractionPresenter.showNextExampleImage()
    }
}

// MARK: - Extensions private func
extension AdditionAndSubtractionViewController{
    private func enableNextExampleBtn(ieEnable: Bool){
        self.nextExampleBtn.isEnabled = ieEnable
    }

    private func hidenViewsNextExamle(viewGameIsOver: Bool, viewWhatWeWillDoNext: Bool){
        showViewGameIsOver.isHidden = viewGameIsOver
        showViewWhatWeWillDoNext.isHidden = viewWhatWeWillDoNext
    }
    
    private func unCheckNumberResult() {
        viewNumberAnswer.layer.borderWidth = 0
        viewNumberAnswer.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func showAllNumbers(){
        viewNumber1.isHidden = false
        viewNumber2.isHidden = false
        viewNumber3.isHidden = false
    }
    
    private func userCompleteLevel(isWinNumber: Bool){
        isUserWinNumber = isWinNumber
    }
    
    private func gameIsOver() -> Bool {
        guard let isUserWinNumber = isUserWinNumber else { return false }
        
        if isUserWinNumber {
            return true
        }
        return false
    }
    
    private func changeViewAfterIntersection(currentView: UIView, secondView: UIView, thirdView: UIView, viewTypeAnswer: UIView){
        hidenCurrentView(view: currentView, isHiden: true)
        changeHidenAnotherView(currentView: currentView, changeHiden1: secondView, changeHiden2: thirdView, isHiden1: false, isHiden2: false)
    }
    
    private func endedTouchesView(view: UIView, position:CGPoint, viewAnswer: UIView){
        view.center = position
        endPressToAnimateImage(view)
        endPressToAnimateImage(viewAnswer)
    }
    
    private func hideAllNumbersView(){
        viewNumber1.isHidden = true
        viewNumber2.isHidden = true
        viewNumber3.isHidden = true
    }
    
    private func hidenCurrentView(view: UIView, isHiden: Bool){
        view.isHidden = isHiden
    }
    
    private func changeHidenAnotherView(currentView: UIView, changeHiden1: UIView, changeHiden2: UIView, isHiden1: Bool, isHiden2: Bool){
        if currentView.isHidden{
            changeHiden1.isHidden = isHiden1
            changeHiden2.isHidden = isHiden2
        }
    }
    
    private func showNextExampleAnimation(isAnimate: Bool){
        if isAnimate{
            let options: UIView.AnimationOptions = [.curveLinear, .repeat, .autoreverse, .allowUserInteraction]
            additionAndSubtractionPresenter.forvardBtnMove(view, options, nextExampleBtn, 0.5, 3, 30)
        }else{
            nextExampleBtn.layer.removeAllAnimations()
        }
    }
    
    private func checkNumberResult() {
        let isAnswer = additionAndSubtractionPresenter.isCorrectNumberImageView()
        if isAnswer{
            changeNumberAnswerLauer(color: UIColor.green.cgColor)
            hideAllNumbersView()
            additionAndSubtractionPresenter.playWinnerSound()
            isUserWinNumber = true
            if gameIsOver(){
                hidenViewsNextExamle(viewGameIsOver: false, viewWhatWeWillDoNext: false)
                isUserInteraction = false
                
                ebableButtons(isEnable: false)
                enableNextExampleBtn(ieEnable: true)
                showNextExampleAnimation(isAnimate: true)
            }
        }else{
            changeNumberAnswerLauer(color: UIColor.red.cgColor)
            additionAndSubtractionPresenter.playLoseSound()
            isUserWinNumber = false
        }
    }
    
    private func changeNumberAnswerLauer(color: CGColor){
        viewNumberAnswer.layer.borderWidth = 8
        viewNumberAnswer.layer.cornerRadius = viewNumberAnswer.bounds.size.width/2
        viewNumberAnswer.layer.borderColor = color
    }
    
    private func ebableButtons(isEnable: Bool){
        self.firstBtnNumber.isEnabled = isEnable
        self.secondBtnNumber.isEnabled = isEnable
    }
}

// MARK: - Extensions Touches Began
extension AdditionAndSubtractionViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let isUserInteraction = isUserInteraction else { return }
        if isUserInteraction{
            if let touch = touches.first {
                // Touche pictures
                let touchPointFirstPicture = touch.location(in: firstPictureImage)
                if firstPictureImage.point(inside: touchPointFirstPicture, with: event){
                    additionAndSubtractionPresenter.playFirstPictureSound()
                    firstPictureImage.wiggle()
                }
                
                let touchPointCharacterPicture = touch.location(in: characterPictureImage)
                if characterPictureImage.point(inside: touchPointCharacterPicture, with: event){
                    pulsateView(characterPictureImage)
                    additionAndSubtractionPresenter.playCharacterPictureSound()
                }
                
                let touchPointSecondPicture = touch.location(in: secondPictureImage)
                if secondPictureImage.point(inside: touchPointSecondPicture, with: event){
                    additionAndSubtractionPresenter.playSecondPictureSound()
                    secondPictureImage.wiggle()
                }
                
                let touchPointEqualPicture = touch.location(in: equalPictureImage)
                if equalPictureImage.point(inside: touchPointEqualPicture, with: event){
                    pulsateView(equalPictureImage)
                    additionAndSubtractionPresenter.playEqualPictureSound()
                }
                
                let touctPointAnswerPicture = touch.location(in: answerPictureImage)
                if answerPictureImage.point(inside: touctPointAnswerPicture, with: event){
                    additionAndSubtractionPresenter.playAnswerPictureSound()
                    answerPictureImage.wiggle()
                }
                
                let touchPointQuestionPicture = touch.location(in: answerNumberImage)
                if answerNumberImage.point(inside: touchPointQuestionPicture, with: event){
                    pulsateView(answerNumberImage)
                    additionAndSubtractionPresenter.playCurrentQuestion()
                    
                    
                }
                
                let touchPointFirstBackgroundNumber = touch.location(in: firstBackgroundNumberImage)
                if firstBackgroundNumberImage.point(inside: touchPointFirstBackgroundNumber, with: event){
                    if viewNumber1.isHidden{
                        additionAndSubtractionPresenter.playFirstBackgroundNumberSound()
                    }
                }
                
                let touchPointSecondBackgroundNumber = touch.location(in: secondBackgroundNumberImage)
                if secondBackgroundNumberImage.point(inside: touchPointSecondBackgroundNumber, with: event){
                    if viewNumber2.isHidden{
                        additionAndSubtractionPresenter.playSecondBackgroundNumberSound()
                    }
                }
                
                let touchPointThirdBackgroundNumber = touch.location(in: thirdBackgroundNumberImage)
                if thirdBackgroundNumberImage.point(inside: touchPointThirdBackgroundNumber, with: event){
                    if viewNumber3.isHidden{
                        additionAndSubtractionPresenter.playThirdBackgroundNumberSound()
                    }
                }
                
                let touchPointFirstVariantAnswerNumber = touch.location(in: viewNumber1)
                if viewNumber1.point(inside: touchPointFirstVariantAnswerNumber, with: event){
                    if !viewNumber1.isHidden{
                        self.touchOffsetViewNumber1 = CGPoint(x: viewNumber1!.bounds.midX - touchPointFirstVariantAnswerNumber.x, y: viewNumber1!.bounds.midY - touchPointFirstVariantAnswerNumber.y)
                        
                        additionAndSubtractionPresenter.playFirstNumberVariantAnswerSound()
                        
                        startPressToAnimateImage(viewNumber1)
                        startPressToAnimateImage(viewNumberAnswer)
                        defaultViewNumber1Position = viewNumber1.center
                    }
                }
                
                let touchPointSecondVariantAnswerNumber = touch.location(in: viewNumber2)
                if viewNumber2.point(inside: touchPointSecondVariantAnswerNumber, with: event){
                    if !viewNumber2.isHidden{
                        self.touchOffsetViewNumber2 = CGPoint(x: viewNumber2!.bounds.midX - touchPointSecondVariantAnswerNumber.x, y: viewNumber2!.bounds.midY - touchPointSecondVariantAnswerNumber.y)
                        
                        additionAndSubtractionPresenter.playSecondNumberVariantAnswerSound()
                        
                        startPressToAnimateImage(viewNumber2)
                        startPressToAnimateImage(viewNumberAnswer)
                        defaultViewNumber2Position = viewNumber2.center
                    }
                }
                
                let touchPointThirdVariantAnswerNumber = touch.location(in: viewNumber3)
                if viewNumber3.point(inside: touchPointThirdVariantAnswerNumber, with: event){
                    if !viewNumber3.isHidden{
                        self.touchOffsetViewNumber3 = CGPoint(x: viewNumber3!.bounds.midX - touchPointThirdVariantAnswerNumber.x, y: viewNumber3!.bounds.midY - touchPointThirdVariantAnswerNumber.y)
                        
                        additionAndSubtractionPresenter.playThirdNumberVariantAnswerSound()
                        
                        startPressToAnimateImage(viewNumber3)
                        startPressToAnimateImage(viewNumberAnswer)
                        defaultViewNumber3Position = viewNumber3.center
                    }
                }
            }
            
        }
    }
}

// MARK: - Extensions Touches Moved
extension AdditionAndSubtractionViewController{
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let isUserInteraction = isUserInteraction else { return }
        if isUserInteraction{
            
            //Touches area on the generalViewForNumbers
            if let touch = touches.first{
                let pointOnNumberView = touch.location(in: generalView)
                let currentViewWhichImageLies = generalView.hitTest(pointOnNumberView, with: event)
                
                switch currentViewWhichImageLies?.tag {
                case viewNumber1.tag:
                    guard let touchOffsetViewNumber1 = self.touchOffsetViewNumber1 else { return }
                    let correction = CGPoint(x: pointOnNumberView.x + touchOffsetViewNumber1.x, y: pointOnNumberView.y + touchOffsetViewNumber1.y)
                    currentViewWhichImageLies?.center = correction
                    
                case viewNumber2.tag:
                    guard let touchOffsetViewNumber2 = self.touchOffsetViewNumber2 else { return }
                    let correction = CGPoint(x: pointOnNumberView.x + touchOffsetViewNumber2.x, y: pointOnNumberView.y + touchOffsetViewNumber2.y)
                    currentViewWhichImageLies?.center = correction
                    
                case viewNumber3.tag:
                    guard let touchOffsetViewNumber3 = self.touchOffsetViewNumber3 else { return }
                    let correction = CGPoint(x: pointOnNumberView.x + touchOffsetViewNumber3.x, y: pointOnNumberView.y + touchOffsetViewNumber3.y)
                    currentViewWhichImageLies?.center = correction
                    
                default:
                    print(DEFAULD_VIEW_NUMBER)
                }
            }
        }
    }
}

// MARK: - Extensions Touches Ended
extension AdditionAndSubtractionViewController{
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Numbers view
        if viewNumber1.frame.insetBy(dx: INTERSECTION_AREA_BY_X, dy: INTERSECTION_AREA_BY_Y).intersects(viewNumberAnswer.frame){
            guard let newAnswerNumberImage = firstNumberVariantAnswer.image else { return }
            additionAndSubtractionPresenter.showChangedNuberAnswerImage(image: newAnswerNumberImage)
            changeViewAfterIntersection(currentView: viewNumber1, secondView: viewNumber2, thirdView: viewNumber3, viewTypeAnswer: viewNumberAnswer)
            checkNumberResult()
        }
        
        if viewNumber2.frame.insetBy(dx: INTERSECTION_AREA_BY_X, dy: INTERSECTION_AREA_BY_Y).intersects(viewNumberAnswer.frame){
            guard let newAnswerNumberImage = secondNumberVariantAnswer.image else { return }
            additionAndSubtractionPresenter.showChangedNuberAnswerImage(image: newAnswerNumberImage)
            changeViewAfterIntersection(currentView: viewNumber2, secondView: viewNumber1, thirdView: viewNumber3, viewTypeAnswer: viewNumberAnswer)
            checkNumberResult()
        }
        
        if viewNumber3.frame.insetBy(dx: INTERSECTION_AREA_BY_X, dy: INTERSECTION_AREA_BY_Y).intersects(viewNumberAnswer.frame){
            guard let newAnswerNumberImage = thirdNumberVariantAnswer.image else { return }
            additionAndSubtractionPresenter.showChangedNuberAnswerImage(image: newAnswerNumberImage)
            changeViewAfterIntersection(currentView: viewNumber3, secondView: viewNumber1, thirdView: viewNumber2, viewTypeAnswer: viewNumberAnswer)
            checkNumberResult()
        }
        
        //default View Numbers Position
        if let defaultViewNumber1Position = defaultViewNumber1Position {
            endedTouchesView(view: viewNumber1, position: defaultViewNumber1Position, viewAnswer: viewNumberAnswer)
        }
        
        if let defaultViewNumber2Position = defaultViewNumber2Position {
            endedTouchesView(view: viewNumber2, position: defaultViewNumber2Position, viewAnswer: viewNumberAnswer)
        }
        
        if let defaultViewNumber3Position = defaultViewNumber3Position {
            endedTouchesView(view: viewNumber3, position: defaultViewNumber3Position, viewAnswer: viewNumberAnswer)
        }
    }
}

// MARK: - Extensions Buttons Action
extension AdditionAndSubtractionViewController{
    @IBAction func nextExampleBtnPressed(_ sender: Any) {
        let transitionFlip = UIView.AnimationOptions.transitionFlipFromLeft
        addflipView(transitionFlip)
        
        additionAndSubtractionPresenter.generateNewGame()
        
        hidenViewsNextExamle(viewGameIsOver: true, viewWhatWeWillDoNext: true)
        userCompleteLevel(isWinNumber: false)
        isUserInteraction = true
        
        showPictireImages()
        showNumbersImages()
        showButtonPictere()
        setAlphaForImages()
        setTagsForView()
        
        showAllNumbers()
        ebableButtons(isEnable: true)
        enableNextExampleBtn(ieEnable: false)
        unCheckNumberResult()
        showNextExampleAnimation(isAnimate: false)
        
        additionAndSubtractionPresenter.playCurrentQuestion()
    }
    
    @IBAction func firstBtnNumberPressed(_ sender: Any) {
        pulsateView(firstBtnNumber)
        additionAndSubtractionPresenter.playFirstNumberSound()
    }
    
    @IBAction func secondBtnNumberPressed(_ sender: Any) {
        pulsateView(secondBtnNumber)
        additionAndSubtractionPresenter.playSecondNumberSound()
    }
}

// MARK: - Extensions Animate
extension AdditionAndSubtractionViewController{
    private func addflipView(_ transitionFlip: UIView.AnimationOptions ){
        isFlipped = !isFlipped
        
        guard let firstViewFlip = generalView else { return }
        let secondViewFlip = firstViewFlip
        UIView.transition(from: firstViewFlip,
                          to: secondViewFlip,
                          duration: DURATION_TIME,
                          options: [transitionFlip, .showHideTransitionViews],
                          completion: nil)
    }
    
    private func startPressToAnimateImage(_ view: UIView){
        UIView.animate(withDuration: 0.3) {
            view.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            view.alpha = 0.8
        }
    }
    
    private func endPressToAnimateImage(_ view: UIView){
        UIView.animate(withDuration: 0.3) {
            view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            view.alpha = 1.0
        }
    }
}

// MARK: - Extension Set statyc images
extension AdditionAndSubtractionViewController: AdditionAndSubtractionViewProtocol{
    
    // MARK: - Set background images
    func setGeneralBackground(_ image: UIImage) {
        self.generalBackground.image = image
    }
    
    // MARK: - Set button image
    func setNextExampleImage(_ image: UIImage) {
        self.nextExampleBtn.setImage(image, for: .normal)
    }
    
    func setFirstBtnNumberImage(_ image: UIImage){
        self.firstBtnNumber.setImage(image, for: .normal)
    }
    
    func setSecondBtnNumberImage(_ image: UIImage){
        self.secondBtnNumber.setImage(image, for: .normal)
    }
}

// MARK: - Extension Set picture images
extension AdditionAndSubtractionViewController {
    func setFirstPictureImage(_ image: UIImage) {
        self.firstPictureImage.image = image
    }
    
    func setCharacterPictureImage(_ image: UIImage) {
        self.characterPictureImage.image = image
    }
    
    func setSecondPictureImage(_ image: UIImage) {
        self.secondPictureImage.image = image
    }
    
    func setEqualPictureImage(_ image: UIImage) {
        self.equalPictureImage.image = image
    }
    
    func setAnswerPictureImage(_ image: UIImage) {
        self.answerPictureImage.image = image
    }
}

// MARK: - Extension Set nubers images
extension AdditionAndSubtractionViewController{
    func setAnswerNumberImage(_ image: UIImage) {
        self.answerNumberImage.image = image
    }
    
    func setFirstNumberVariantAnswer(_ image: UIImage) {
        self.firstNumberVariantAnswer.image = image
    }
    
    func setSecondNumberVariantAnswer(_ image: UIImage) {
        self.secondNumberVariantAnswer.image = image
    }
    
    func setThirdNumberVariantAnswer(_ image: UIImage) {
        self.thirdNumberVariantAnswer.image = image
    }
    
    func setFirstBackgroundNumberImage(_ image: UIImage) {
        self.firstBackgroundNumberImage.image = image
    }
    
    func setSecondBackgroundNumberImage(_ image: UIImage) {
        self.secondBackgroundNumberImage.image = image
    }
    
    func setThirdBackgroundNumberImage(_ image: UIImage) {
        self.thirdBackgroundNumberImage.image = image
    }
}
