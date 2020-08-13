//
//  AllCategoriesViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 29/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

class AllCategoriesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var generalBackgroundImage: UIImageView!
    @IBOutlet weak var generalBackgroundCloudImage: UIImageView!

    @IBOutlet weak var alphabetBtn: UIButton!
    @IBOutlet weak var numbersBtn: UIButton!
    @IBOutlet weak var syllablesBtn: UIButton!
    @IBOutlet weak var additionAndSubtractionBtn: UIButton!
    
    @IBOutlet weak var lockAdditionSubtractionBtn: UIButton!
    @IBOutlet weak var lockNumberBtn: UIButton!
    
    @IBOutlet weak var syllablesBoy: UIImageView!
    @IBOutlet weak var additionAndSubtractionGirl: UIImageView!
    @IBOutlet weak var numbersImage: UIImageView!
    @IBOutlet weak var alphabetImage: UIImageView!
    
    @IBOutlet weak var syllablesTextImage: UIImageView!
    @IBOutlet weak var additionAndSubtractionTextImage: UIImageView!
    @IBOutlet weak var numbersTextImage: UIImageView!
    @IBOutlet weak var alphabetTextImage: UIImageView!
    
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var cloud5: UIImageView!
    
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud6: UIImageView!
    @IBOutlet weak var cloud7: UIImageView!
    
    @IBOutlet weak var firstNumbersViewAlpha: UIView!
    @IBOutlet weak var secondNumberViewAlpha: UIView!
    
    @IBOutlet weak var firstAdditionSubtractionViewAlpha: UIView!
    @IBOutlet weak var secondAdditionSubtaractionViewAlpha: UIView!
    
    // MARK: - Public property
    var categoryPresenter: CategoriesViewPresenterProtocol!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarButtonItem()
        categoryPresenter.playChooseGameSound()
        
        showPurchaseContent()
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private func
    private func showPurchaseContent(){
        if AutoRenewable.shared.showContent{
            setAlphas(alpha: 1)
            buttonsCategoryIsHidden(hidden: false)
            buttonsLockCategoryIsHidden(hidden: true)
        }else{
            setAlphas(alpha: 0.6)
            buttonsCategoryIsHidden(hidden: true)
            buttonsLockCategoryIsHidden(hidden: false)
        }
    }
    
    private func setAlphas(alpha: CGFloat){
        firstNumbersViewAlpha.alpha = alpha
        secondNumberViewAlpha.alpha = alpha
        firstAdditionSubtractionViewAlpha.alpha = alpha
        secondAdditionSubtaractionViewAlpha.alpha = alpha
    }
    
    private func buttonsCategoryIsHidden(hidden: Bool){
        numbersBtn.isHidden = hidden
        additionAndSubtractionBtn.isHidden = hidden
    }
    
    private func buttonsLockCategoryIsHidden(hidden: Bool){
        lockNumberBtn.isHidden = hidden
        lockAdditionSubtractionBtn.isHidden = hidden
    }
    
    private func setNavigationBarButtonItem(){
        self.navigationItem.hidesBackButton = true
        guard let imageBackFinger = UIImage(named: BACK_FINGET_IMAGE_NAME) else { return }
        let backFingerButton = UIBarButtonItem(image: imageBackFinger.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handlerBack(sender:)))
        self.navigationItem.leftBarButtonItem = backFingerButton
    }
    
    // MARK: - Actions
    @IBAction func showAlphabetBtnPressed(_ sender: UIButton) {
        categoryPresenter.tapOnTheAlphabetCategory()
    }
    
    @IBAction func showNumbersBtnPressed(_ sender: UIButton) {
        categoryPresenter.tapOnTheNumbersCategory()
    }
    
    @IBAction func showReadSyllablesBtnPressed(_ sender: UIButton) {
        categoryPresenter.tapOnTheReadSyllablesCategory()
    }
    
    @IBAction func showAditionAndSubtractionBtnPressed(_ sender: UIButton) {
        categoryPresenter.tapOnTheAdditionAndSubtractionCategory()
    }
    
    @IBAction func lockNumberBtnPressed(_ sender: UIButton) {
        categoryPresenter.playContentLock()
    }
    
    @IBAction func lockAdditionSubtractionBtnPressed(_ sender: UIButton) {
        categoryPresenter.playContentLock()
    }
    
}

// MARK: - Extension AllCategoriesViewProtocol
extension AllCategoriesViewController: AllCategoriesViewProtocol{

    func setGeneralBackgroundImage(_ image: UIImage){
        generalBackgroundImage.image = image
    }
    
    func setGeneralBackgroundCloudImage(_ image: UIImage){
        generalBackgroundCloudImage.image = image
    }
    
    func setCloud2Image(_ image: UIImage) {
        cloud2.image = image
    }
    
    func setCloud3Image(_ image: UIImage) {
        cloud3.image = image
    }
    
    func setCloud4Image(_ image: UIImage) {
        cloud4.image = image
    }
    
    func setCloud5Image(_ image: UIImage) {
        cloud5.image = image
    }
    
    func setSyllablesBoyImage(_ image: UIImage) {
        syllablesBoy.image = image
    }
    
    func setAdditionAndSubtractionGirlImage(_ image: UIImage) {
        additionAndSubtractionGirl.image = image
    }
    
    func setNumbersImage(_ image: UIImage) {
        numbersImage.image = image
    }
    
    func setAlphabetImage(_ image: UIImage) {
        alphabetImage.image = image
    }
    
    func setSyllablesTextImage(_ image: UIImage) {
        syllablesTextImage.image = image
    }
    
    func setAdditionAndSubtractionTextImage(_ image: UIImage) {
        additionAndSubtractionTextImage.image = image
    }
    
    func setNumbersTextImage(_ image: UIImage) {
        numbersTextImage.image = image
    }
    
    func setAlphabetTextImage(_ image: UIImage) {
        alphabetTextImage.image = image
    }
    
    func setCloud1Image(_ image: UIImage) {
        cloud1.image = image
    }
    
    func setCloud6Image(_ image: UIImage) {
        cloud6.image = image
    }
    
    func setCloud7Image(_ image: UIImage) {
        cloud7.image = image
    }
}
