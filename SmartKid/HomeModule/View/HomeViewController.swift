//
//  HomeViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 28/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

enum ResultImage: String {
    case successResult = "successImage"
    case errorResult = "errorImage"
}

class HomeViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Internal property
    internal var homePresenter: HomeViewPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet weak var homeBackgroundImage: UIImageView!
    @IBOutlet weak var homeBackgroundCloudsImage: UIImageView!
    @IBOutlet weak var homeAppName: UIImageView!
    @IBOutlet weak var homeStartLearning: UIButton!
    @IBOutlet weak var homeOpenSettings: UIButton!
    
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var cloud5: UIImageView!
    @IBOutlet weak var cloud6: UIImageView!
    
    @IBOutlet weak var customAlert: UIView!
    @IBOutlet weak var closeCustomAlert: UIButton!
    
    weak var delegateCustomPopUp: CustomPopUpWindowProtocol?
    
    @IBOutlet weak var backgroundButtonZero: UIImageView!
    @IBOutlet weak var backgroundButtonOne: UIImageView!
    @IBOutlet weak var backgroundButtonTwo: UIImageView!
    @IBOutlet weak var backgroundButtonThree: UIImageView!
    @IBOutlet weak var backgroundButtonFour: UIImageView!
    @IBOutlet weak var backgroundButtonFive: UIImageView!
    @IBOutlet weak var backgroundButtonSix: UIImageView!
    @IBOutlet weak var backgroundButtonSeven: UIImageView!
    @IBOutlet weak var backgroundButtonEight: UIImageView!
    @IBOutlet weak var backgroundButtonNine: UIImageView!
    
    @IBOutlet weak var fontBtnImageZero: UIImageView!
    @IBOutlet weak var fontBtnImageOne: UIImageView!
    @IBOutlet weak var fontBtnImageTwo: UIImageView!
    @IBOutlet weak var fontBtnImageThree: UIImageView!
    @IBOutlet weak var fontBtnImageFour: UIImageView!
    @IBOutlet weak var fontBtnImageFive: UIImageView!
    @IBOutlet weak var fontBtnImageSix: UIImageView!
    @IBOutlet weak var fontBtnImageSeven: UIImageView!
    @IBOutlet weak var fontBtnImageEight: UIImageView!
    @IBOutlet weak var fontBtnImageNine: UIImageView!
    
    @IBOutlet weak var imageEnterCodeForCheck: UIImageView!
    
    @IBOutlet weak var firsWordNumber: UIImageView!
    @IBOutlet weak var secondWordNumber: UIImageView!
    @IBOutlet weak var thirdWordNumber: UIImageView!
    
    @IBOutlet weak var firstFieldForNumber: UIImageView!
    @IBOutlet weak var secondFieldForNumber: UIImageView!
    @IBOutlet weak var thirdFieldForNumber: UIImageView!
    
    @IBOutlet weak var checkUserResultBtn: UIButton!
    @IBOutlet weak var successImage: UIImageView!
    
    // MARK: - Private property
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    var effect: UIVisualEffect!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkUserSubscription()
        
        self.delegateCustomPopUp = self

        setCheckMenuEffects()
        setDefaultProperty()
        showHomeImages()
    
        
        runSpinAnimationObject(homeOpenSettings, 0.05, 0.05)
        
        hideBackgroundButtons()
        setUpUserInteractionEnabled()
        createGestureRecognizer()
        
        homePresenter.playStartGameSound()
        
        enableStartLearnButton()
    
        BackgroundSound.shared.playBackgroundMusic()
    }
    
    
    
    deinit {
        print("deinit HomeViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCloudAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private func
    private func checkUserSubscription(){
        if AutoRenewable.shared.userBuyAutoRenewableSubscription(){
            
            IAPManager.shared.checkCancellationDate()
            AutoRenewable.shared.setCurrentSubscriptionStatus()
           
        }
    }
    
    private func enableStartLearnButton(){
        Timer.scheduledTimer(withTimeInterval: DURATION_BEFORE_SPEACH_END, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.homeStartLearning.isUserInteractionEnabled = true
            addPulsate(self.homeStartLearning)
        }
    }
    
    private func hideBackgroundButtons(){
        backgroundButtonZero.isHidden = true
        backgroundButtonOne.isHidden = true
        backgroundButtonTwo.isHidden = true
        backgroundButtonThree.isHidden = true
        backgroundButtonFour.isHidden = true
        backgroundButtonFive.isHidden = true
        backgroundButtonSix.isHidden = true
        backgroundButtonSeven.isHidden = true
        backgroundButtonEight.isHidden = true
        backgroundButtonNine.isHidden = true
    }
    
    private func setCheckMenuEffects(){
        customAlert.alpha = 0
        visualEffectView.alpha = 0
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        successImage.alpha = 0
    }
    
    private func createGestureRecognizer(){
        let pressedZeroImage = UITapGestureRecognizer(target: self,
                                                      action:#selector(handlerZeroImagePressed(sender:)))
        
        let pressedOneImage = UITapGestureRecognizer(target: self,
                                                     action:#selector(handlerOneImagePressed(sender:)))
        
        let pressedTwoImage = UITapGestureRecognizer(target: self,
                                                     action:#selector(handlerTwoImagePressed(sender:)))
        
        let pressedThreeImage = UITapGestureRecognizer(target: self,
                                                       action:#selector(handlerThreeImagePressed(sender:)))
        
        let pressedFourImage = UITapGestureRecognizer(target: self,
                                                      action:#selector(handlerFourImagePressed(sender:)))
        
        let pressedFiveImage = UITapGestureRecognizer(target: self,
                                                      action:#selector(handlerFiveImagePressed(sender:)))
        
        let pressedSixImage = UITapGestureRecognizer(target: self,
                                                     action:#selector(handlerSixImagePressed(sender:)))
        
        let pressedSevenImage = UITapGestureRecognizer(target: self,
                                                       action:#selector(handlerSevenImagePressed(sender:)))
        
        let pressedEightImage = UITapGestureRecognizer(target: self,
                                                       action:#selector(handlerEightImagePressed(sender:)))
        
        let pressedNineImage = UITapGestureRecognizer(target: self,
                                                      action:#selector(handlerNineImagePressed(sender:)))
            
        fontBtnImageZero.addGestureRecognizer(pressedZeroImage)
        fontBtnImageOne.addGestureRecognizer(pressedOneImage)
        fontBtnImageTwo.addGestureRecognizer(pressedTwoImage)
        fontBtnImageThree.addGestureRecognizer(pressedThreeImage)
        fontBtnImageFour.addGestureRecognizer(pressedFourImage)
        fontBtnImageFive.addGestureRecognizer(pressedFiveImage)
        fontBtnImageSix.addGestureRecognizer(pressedSixImage)
        fontBtnImageSeven.addGestureRecognizer(pressedSevenImage)
        fontBtnImageEight.addGestureRecognizer(pressedEightImage)
        fontBtnImageNine.addGestureRecognizer(pressedNineImage)
    }
    
    private func setUpUserInteractionEnabled(){
        homeStartLearning.isUserInteractionEnabled = false
        fontBtnImageZero.isUserInteractionEnabled = true
        fontBtnImageOne.isUserInteractionEnabled = true
        fontBtnImageTwo.isUserInteractionEnabled = true
        fontBtnImageThree.isUserInteractionEnabled = true
        fontBtnImageFour.isUserInteractionEnabled = true
        fontBtnImageFive.isUserInteractionEnabled = true
        fontBtnImageSix.isUserInteractionEnabled = true
        fontBtnImageSeven.isUserInteractionEnabled = true
        fontBtnImageEight.isUserInteractionEnabled = true
        fontBtnImageNine.isUserInteractionEnabled = true
    }
    
    private func showHomeImages(){
        homePresenter.showHomeBackgroundImage()
        homePresenter.showHomeBackgroundCloudsImage()
        homePresenter.showHomeAppNameImage()
        homePresenter.showHomePlayButtonImage()
        homePresenter.showHomeSettingsButtonImage()
        
        homePresenter.showCloud1Image()
        homePresenter.showCloud2Image()
        homePresenter.showCloud3Image()
        homePresenter.showCloud4Image()
        homePresenter.showCloud5Image()
        homePresenter.showCloud6Image()
    }
    
    private func showCloudAnimation(){
        let options: UIView.AnimationOptions = [.curveLinear, .repeat, .autoreverse]
        
        homePresenter.showCloudMove(view, options, cloud1, 4.0, 0.0, 20)
        homePresenter.showCloudMove(view, options, cloud2, 4.0, 0.3, 20)
        homePresenter.showCloudMove(view, options, cloud3, 4.0, 0.6, 20)
        homePresenter.showCloudMove(view, options, cloud4, 3.0, 0.0, 20)
        homePresenter.showCloudMove(view, options, cloud5, 4.0, 0.3, 20)
        homePresenter.showCloudMove(view, options, cloud6, 4.0, 0.6, 20)
    }
    
    private func setDefaultProperty(){
        hideBackgroundButtons()
        firstFieldForNumber.image = UIImage(named: DEFAULD_FIELD_FOR_NUMBER)
        secondFieldForNumber.image = UIImage(named: DEFAULD_FIELD_FOR_NUMBER)
        thirdFieldForNumber.image = UIImage(named: DEFAULD_FIELD_FOR_NUMBER)
        checkUserResultBtn.isEnabled = false
    }
    
    private func changeAlphaChanels (alpha: CGFloat) {
        self.imageEnterCodeForCheck.alpha = alpha
        self.firstFieldForNumber.alpha = alpha
        self.secondFieldForNumber.alpha = alpha
        self.thirdFieldForNumber.alpha = alpha
        self.firsWordNumber.alpha = alpha
        self.secondWordNumber.alpha = alpha
        self.thirdWordNumber.alpha = alpha
        self.checkUserResultBtn.alpha = alpha
    }
    
    // MARK: - Aktions
    @IBAction func settingsBtnPressed(_ sender: UIButton) {
        changeAlphaChanels(alpha: 1)
        
        self.successImage.alpha = 0
        
        homePresenter.generateRandomIndexes()
        delegateCustomPopUp?.popUpWindowOn(scaleX: 1.3, scaleY: 1.3, duration: 0.3, alphaShow: 1, alphaHiden: 0)
        
        homePresenter.showRandomNameImageNumbers()
        homePresenter.playSettingsAdult()
    }
    
    @IBAction func homeStartLearnBtnPressed(_ sender: UIButton) {
        
        homePresenter.tapOnTheStartStudy()
    }
    
    @IBAction func closeCustomAlertPressed(_ sender: UIButton) {
        setDefaultProperty()
        delegateCustomPopUp?.popUpWindowOff(scaleX: 1.3, scaleY: 1.3, duration: 0.3, alphaHiden: 0)
    }
    
    @IBAction func checkUserResultBtnPressed(_ sender: UIButton) {
        guard let index0 = homePresenter.firstRandomIndex else { return }
        guard let index1 = homePresenter.secondRandomIndex else { return }
        guard let index2 = homePresenter.thirdRandomIndex else { return }
        
        if firstFieldForNumber.image == UIImage(named: homePresenter.arrayFieldWithNumbers[index0]) &&
            secondFieldForNumber.image == UIImage(named: homePresenter.arrayFieldWithNumbers[index1]) &&
            thirdFieldForNumber.image == UIImage(named: homePresenter.arrayFieldWithNumbers[index2]){

            changeAlphaChanels(alpha: 0)
            homePresenter.showResultImage(name: ResultImage.successResult.rawValue)
            successImage.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            UIView.animate(withDuration: 0.6, animations: { [weak self] in
                guard let self = self else { return }
                self.successImage.transform = CGAffineTransform.identity
                self.successImage.alpha = 1
            }) { [weak self] success in
                guard let self = self else { return }
                if success {
                    self.setDefaultProperty()
                    self.delegateCustomPopUp?.popUpWindowOff(scaleX: 1.3, scaleY: 1.3, duration: 0.3, alphaHiden: 0)
                    self.homePresenter.tapOnTheSettings()
                }
            }
        }
        else{
            changeAlphaChanels(alpha: 0)
            homePresenter.showResultImage(name: ResultImage.errorResult.rawValue)
            
            successImage.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            UIView.animate(withDuration: 0.6, animations: { [weak self] in
                guard let self = self else { return }
                self.successImage.transform = CGAffineTransform.identity
                self.successImage.alpha = 1
            }) { [weak self] success in
                guard let self = self else { return }
                self.setDefaultProperty()
                self.delegateCustomPopUp?.popUpWindowOff(scaleX: 1.3, scaleY: 1.3, duration: 0.3, alphaHiden: 0)
            }
        }
    }
}

// MARK: - Extensions HomeViewProtocol
extension HomeViewController: HomeViewProtocol{
    
    func setResultImage(_ image: UIImage) {
        self.successImage.image = image
    }
    
    func setRandomNameImageNumbers(firstIndex: Int, secondIndex: Int, thirdIndex: Int) {
        let arrayWithNames = homePresenter.arrayNameImageNumbers
        firsWordNumber.image = UIImage(named: arrayWithNames[firstIndex])
        secondWordNumber.image = UIImage(named: arrayWithNames[secondIndex])
        thirdWordNumber.image = UIImage(named: arrayWithNames[thirdIndex])
    }
    
    func setHomeBackgroundImage(_ image: UIImage) {
        self.homeBackgroundImage.image = image
    }
    
    func setHomeBackgroundCloudsImage(_ image: UIImage) {
        self.homeBackgroundCloudsImage.image = image
    }
    
    func setHomeAppNameImage(_ image: UIImage) {
        self.homeAppName.image = image
    }
    
    func setHomePlayButtonImage(_ image: UIImage) {
        self.homeStartLearning.setImage(image, for: .normal)
    }
    
    func setHomeSettingsButtonImage(_ image: UIImage) {
        self.homeOpenSettings.setImage(image, for: .normal)
    }
    
    func setCloud1Image(_ image: UIImage) {
        self.cloud1.image = image
    }
    
    func setCloud2Image(_ image: UIImage) {
        self.cloud2.image = image
    }
    
    func setCloud3Image(_ image: UIImage) {
        self.cloud3.image = image
    }
    
    func setCloud4Image(_ image: UIImage) {
        self.cloud4.image = image
    }
    
    func setCloud5Image(_ image: UIImage) {
        self.cloud5.image = image
    }
    
    func setCloud6Image(_ image: UIImage) {
        self.cloud6.image = image
    }
}
