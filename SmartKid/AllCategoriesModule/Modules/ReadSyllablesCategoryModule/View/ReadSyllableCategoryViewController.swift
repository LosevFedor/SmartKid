//
//  ReadSyllableCategoryViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 13/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

class ReadSyllableCategoryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var generalBackgroundImage: UIImageView!
    @IBOutlet weak var syllablesBtn: UIButton!
    
    @IBOutlet weak var twoSyllablesBtn: UIButton!
    @IBOutlet weak var threeSyllablesBtn: UIButton!
    
    @IBOutlet weak var lockReadSyllableGame2Btn: UIButton!
    @IBOutlet weak var lockReadSyllableGame3Btn: UIButton!
    
    // MARK: - Public property
    public var readSyllableCategoryPresenter: ReadSyllableCategoryViewPresenterProtocol!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        showReadSyllableCategoryImages()
        setNavigationBarButtonItem()
        
        readSyllableCategoryPresenter.playChooseDifficultySound()
        showPurchaseContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        enableUserInteractionButtons(isEnable: true)
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private func
    private func showPurchaseContent(){
        if AutoRenewable.shared.showContent{
            setAlphas(alpha: 1)
            buttonsCategoryIsEnabled(enabled: true)
            buttonsLockCategoryIsHidden(hidden: true)
        }else{
            setAlphas(alpha: 0.6)
            buttonsCategoryIsEnabled(enabled: false)
            buttonsLockCategoryIsHidden(hidden: false)
        }
    }
    
    private func setAlphas(alpha: CGFloat){
        self.twoSyllablesBtn.alpha = alpha
        self.threeSyllablesBtn.alpha = alpha
    }
    
    private func buttonsCategoryIsEnabled(enabled: Bool){
        self.twoSyllablesBtn.isEnabled = enabled
        self.threeSyllablesBtn.isEnabled = enabled
    }
    
    private func buttonsLockCategoryIsHidden(hidden: Bool){
        lockReadSyllableGame2Btn.isHidden = hidden
        lockReadSyllableGame3Btn.isHidden = hidden
    }
    
    private func enableUserInteractionButtons(isEnable: Bool){
        self.syllablesBtn.isUserInteractionEnabled = isEnable
        self.twoSyllablesBtn.isUserInteractionEnabled = isEnable
        self.threeSyllablesBtn.isUserInteractionEnabled = isEnable
    }
    
    private func setNavigationBarButtonItem(){
        self.navigationItem.hidesBackButton = true
        guard let imageBackFinger = UIImage(named: BACK_FINGET_IMAGE_NAME) else { return }
        let backFingerButton = UIBarButtonItem(image: imageBackFinger.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handlerBack(sender:)))
        self.navigationItem.leftBarButtonItem = backFingerButton
    }
    
    private func showReadSyllableCategoryImages(){
        readSyllableCategoryPresenter.showGeneralBackgroundImage()
        readSyllableCategoryPresenter.showSyllablesImage()
        readSyllableCategoryPresenter.show2SyllablesImage()
        readSyllableCategoryPresenter.show3SyllablesImage()
    }
    
    // MARK: - Actions
    @IBAction func syllablesBtnPressed(_ sender: UIButton) {
        enableUserInteractionButtons(isEnable: false)
        self.readSyllableCategoryPresenter.tapOnTheSyllablesBtn()
    }
    @IBAction func twoSyllablesBtnPressed(_ sender: UIButton) {
        enableUserInteractionButtons(isEnable: false)
        self.readSyllableCategoryPresenter.tapOnThe2SyllablesBtn()
    }
    
    @IBAction func threeSyllablesBtnPressed(_ sender: UIButton) {
        enableUserInteractionButtons(isEnable: false)
        self.readSyllableCategoryPresenter.tapOnThe3SyllablesBtn()
    }
    
    @IBAction func lockReadSyllableGame2BtnPressed(_ sender: UIButton) {
        self.readSyllableCategoryPresenter.playContentLock()
    }
    
    @IBAction func lockReadSyllableGame3BtnPressed(_ sender: UIButton) {
        self.readSyllableCategoryPresenter.playContentLock()
    }
}

// MARK: - extension ReadSyllableCategoryViewProtocol
extension ReadSyllableCategoryViewController: ReadSyllableCategoryViewProtocol{
    
    func setGeneralBackgroundImage(_ image: UIImage) {
        self.generalBackgroundImage.image = image
    }
    
    func setSyllablesImage(_ image: UIImage) {
        self.syllablesBtn.setBackgroundImage(image, for: .normal)
    }
    
    func set2SyllablesImage(_ image: UIImage) {
        self.twoSyllablesBtn.setBackgroundImage(image, for: .normal)
    }
    
    func set3SyllablesImage(_ image: UIImage) {
        self.threeSyllablesBtn.setBackgroundImage(image, for: .normal)
    }
}
