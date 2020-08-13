//
//  SettingsViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 28/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController {
    
    // MARK: - Internal property
    internal var settingsPresenter: SettingsViewPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet weak var generalBackgroundImage: UIImageView!
    @IBOutlet weak var generalBackgroundCloudsImage: UIImageView!
    @IBOutlet weak var imageInscriptionsSounds: UIImageView!
    @IBOutlet weak var imageInscriptionsContacts: UIImageView!
    
    @IBOutlet weak var cloud1Image: UIImageView!
    @IBOutlet weak var cloud2Image: UIImageView!
    @IBOutlet weak var cloud3Image: UIImageView!
    @IBOutlet weak var cloud4Image: UIImageView!
    
    @IBOutlet weak var labelAppName: UILabel!
    @IBOutlet weak var labelCost: UILabel!
    @IBOutlet weak var labelUserGetFormSubscribe: UILabel!
    @IBOutlet weak var labelDescriptionCost: UILabel!
    @IBOutlet weak var textViewTermOfUseLink: UITextView!
    @IBOutlet weak var textViewPrivacyPolicyLink: UITextView!
    @IBOutlet weak var musicOn: UIButton!
    
    @IBOutlet weak var loadIndecator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var subscriptionBtn: UIButton!

    
    // MARK: Private property
    private var soundOnOrOff = true
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndecator.isHidden = true
        showImages()
        showLabels()
        showCloudAnimation()
        setNavigationBarButtonItem()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(completeAutoRenewable), name: Notification.Name(IAPProducts.autoRenewable.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorSubscriptionTransaction), name: Notification.Name(IAPProductsNotificationErrors.errorSubscriptionTransaction.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deferredSubscriptionTransaction), name: Notification.Name(IAPProductsNotificationErrors.deferredSubscriptionTransaction.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(purchasingSubscriptionTransaction), name: Notification.Name(IAPProductsNotificationErrors.purchasingSubscriptionTransaction.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(faildSubscriptionTransaction), name: Notification.Name(IAPProductsNotificationErrors.faildSubscriptionTransaction.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restoredSubscriptionTransaction), name: Notification.Name(IAPProductsNotificationErrors.restoredSubscriptionTransaction.rawValue), object: nil)
        
        
        
        textViewTermOfUseLink.delegate = self
        textViewPrivacyPolicyLink.delegate = self
        
        addLinks()
        
    }
    
    // MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
//    @objc func handlerRestoreProduct(){
//        settingsPresenter.tapOnTheRestoreProductBtn()
//    }
    
    @objc func completeAutoRenewable(){
        stopSubscriptionLoadAnimation()
        settingsPresenter.showSubscriptionImage()
    }
    
    @objc func errorSubscriptionTransaction(){
        stopSubscriptionLoadAnimation()
    }
    
    @objc func deferredSubscriptionTransaction(){
        stopSubscriptionLoadAnimation()
    }
    
    @objc func purchasingSubscriptionTransaction(){
        //startSubscriptionLoadAnimation()
    }
    
    @objc func faildSubscriptionTransaction(){
        stopSubscriptionLoadAnimation()
    }
    
    @objc func restoredSubscriptionTransaction(){
        stopSubscriptionLoadAnimation()
    }
    
    // MARK: - Private func
    private func startSubscriptionLoadAnimation(){
        loadIndecator.startAnimating()
        loadIndecator.isHidden = false
    }
    
    private func stopSubscriptionLoadAnimation(){
        loadIndecator.stopAnimating()
        loadIndecator.isHidden = true
    }
    
    private func addLinks(){
        let termAttributedString = NSMutableAttributedString(string:DESCRIPTION_LINK_TERM_OF_USE)
        termAttributedString.addAttribute(.link, value: LINK_TERM_OF_USE, range: NSRange(location: 40, length: 59))
        
        let privasyAttributedString = NSMutableAttributedString(string:DESCRIPTION_LINK_PRIVACY_POLICY)
        privasyAttributedString.addAttribute(.link, value: LINK_PRIVACY_POLICY, range: NSRange(location: 57, length: 61))

        textViewTermOfUseLink.attributedText = termAttributedString
        textViewTermOfUseLink.textColor = #colorLiteral(red: 0.2933844924, green: 0.3184796274, blue: 0.627835393, alpha: 1)
        textViewPrivacyPolicyLink.attributedText = privasyAttributedString
        textViewPrivacyPolicyLink.textColor = #colorLiteral(red: 0.2933844924, green: 0.3184796274, blue: 0.627835393, alpha: 1)
    }
    
    private func setNavigationBarButtonItem(){
        self.navigationItem.hidesBackButton = true
        guard let imageBackFinger = UIImage(named: BACK_FINGET_IMAGE_NAME) else { return }
        let backFingerButton = UIBarButtonItem(image: imageBackFinger.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handlerBack(sender:)))
        self.navigationItem.leftBarButtonItem = backFingerButton
        
//        let restoreProduct = UIBarButtonItem(title: "Восстановить покупку", style: .plain, target: self, action: #selector(handlerRestoreProduct))
//        restoreProduct.tintColor = .red
//        self.navigationItem.rightBarButtonItem = restoreProduct
    }
    
    private func showImages(){
        settingsPresenter.showGeneralBackgroundImage()
        settingsPresenter.showGeneralBackgroundCloudsImage()
        settingsPresenter.showImageInscriptionsSounds()
        settingsPresenter.showImageInscriptionsContacts()

        settingsPresenter.showEmailImage()
        settingsPresenter.showSubscriptionImage()
        settingsPresenter.showMelodyOnImage()
        settingsPresenter.showCloud1Image()
        settingsPresenter.showCloud2Image()
        settingsPresenter.showCloud3Image()
        settingsPresenter.showCloud4Image()
    }
    
    private func showLabels(){
        settingsPresenter.showLabelViewAppNameProduct()
        settingsPresenter.showLabelProductCost()
        settingsPresenter.showLabelWhatGamesUserGet()
        settingsPresenter.showLabelDescriptionCost()
    }
    
    private func showCloudAnimation(){
        let options: UIView.AnimationOptions = [.curveLinear, .repeat, .autoreverse]
        settingsPresenter.showCloudMove(view, options, cloud1Image, 4.0, 0.0, 20)
        settingsPresenter.showCloudMove(view, options, cloud2Image, 4.0, 0.0, -20)
        settingsPresenter.showCloudMove(view, options, cloud3Image, 3.0, 0.0, -20)
        settingsPresenter.showCloudMove(view, options, cloud4Image, 3.0, 0.0, 20)
    }
    
    // MARK: - Aktions
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        let isMusicStatus = BackgroundSound.shared.getBackgroundMusicStatus()
        if isMusicStatus{
            BackgroundSound.shared.changeBackgroundMusicStatus(isStatus: !isMusicStatus)
            BackgroundSound.shared.stopBackgroundMusic()
        }else{
            BackgroundSound.shared.changeBackgroundMusicStatus(isStatus: !isMusicStatus)
            BackgroundSound.shared.playBackgroundMusic()
        }
        settingsPresenter.showMelodyOnImage()
        settingsPresenter.playStatusMelodyImage()
    }
    
    @IBAction func emailBtnPressed(_ sender: UIButton) {
        tryToSendEmail()
    }
    
    @IBAction func subscriptionBtnPressed(_ sender: UIButton) {
        startSubscriptionLoadAnimation()
        settingsPresenter.tapOnTheSubscriptionBtn()
    }
    
}

// MARK: - Extensions UITextView
extension SettingsViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == LINK_TERM_OF_USE{
            if let appURL = Foundation.URL(string: LINK_TERM_OF_USE) {
                UIApplication.shared.open(appURL) { success in
                    if success {
                        print("The URL was delivered successfully.")
                    } else {
                        print("The URL failed to open.")
                        return
                    }
                }
            } else {
                print("Invalid URL specified.")
                return false
            }
        }
        
        if URL.absoluteString == LINK_PRIVACY_POLICY{
            if let appURL = Foundation.URL(string: LINK_PRIVACY_POLICY) {
                UIApplication.shared.open(appURL) { success in
                    if success {
                        print("The URL was delivered successfully.")
                    } else {
                        print("The URL failed to open.")
                        return
                    }
                }
            } else {
                print("Invalid URL specified.")
                return false
            }
        }
        return false
    }
}

// MARK: - Extensions SettingsViewProtocol
extension SettingsViewController: SettingsViewProtocol{
    func setGeneralBackgroundImage(image: UIImage) {
        self.generalBackgroundImage.image = image
    }
    
    func setGeneralBackgroundCloudsImage(image: UIImage) {
        self.generalBackgroundCloudsImage.image = image
    }
    
    func setImageInscriptionsSounds(image: UIImage) {
        self.imageInscriptionsSounds.image = image
    }
    
    func setimageInscriptionsContacts(image: UIImage) {
        self.imageInscriptionsContacts.image = image
    }

    func setSubscriptionImage(image: UIImage, isEnableBtn: Bool) {
        self.subscriptionBtn.setImage(image, for: .normal)
        self.subscriptionBtn.isEnabled = isEnableBtn
    }
    
    func setLabelAppNameProduct(label: String) {
        self.labelAppName.text = label
    }
    
    func setLabelWhatGamesUserGet(label: String) {
        self.labelUserGetFormSubscribe.text = label
    }
    func setLabelProductCost(label: String) {
        self.labelCost.text = label
    }
    
    func setLabelDescriptionCost(label: String) {
        self.labelDescriptionCost.text = label
    }
    
    func setEmailImage(image: UIImage) {
        self.emailBtn.setImage(image, for: .normal)
    }
    
    func setMelodyOnImage(image: UIImage) {
        self.musicOn.setImage(image, for: .normal)
    }
    
    func setCloud1Image(image: UIImage) {
        self.cloud1Image.image = image
    }
    
    func setCloud2Image(image: UIImage) {
        self.cloud2Image.image = image
    }
    
    func setCloud3Image(image: UIImage) {
        self.cloud3Image.image = image
    }
    
    func setCloud4Image(image: UIImage) {
        self.cloud4Image.image = image
    }
    
}

// MARK: - Extensions MFMailComposeViewControllerDelegate
extension SettingsViewController: MFMailComposeViewControllerDelegate{
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }
    
    private func tryToSendEmail() {
        if MFMailComposeViewController.canSendMail() {
            sendEmail()
        } else {
            showErrorAlert()
        }
    }
    
    private func showErrorAlert(){
        let alert = UIAlertController.init(title: ERROR_MAIL_TITLE, message: ERROR_MAIL_TEXT, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: OK_BTN, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func sendEmail(){
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([MAIL_ADDRESS])
        let userUUID = GeneratorUserUID.shared.getUUID()
        mail.setSubject("ID:\(userUUID)")
        present(mail, animated: true)
    }
}

