//
//  NumbersCategoryViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 03/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

enum TagNumber: Int {
    case zeroTag = 0
    case oneTag = 1
    case twoTag = 2
    case threeTag = 3
    case fourTag = 4
    case fiveTag = 5
    case sixTag = 6
    case sevenTag = 7
    case eightTag = 8
    case nineTag = 9
}

class NumbersCategoryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imageNumbersBackground: UIImageView!
    @IBOutlet weak var imageNumberArea: UIImageView!
    
    
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    
    // MARK: - Public property
    var numbersCategoryPresenter: NumbersCategoryViewPresenterProtocol!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setNumbersCategoryImages()
        setButtonsTag()
        setNavigationBarButtonItem()
        
        numbersCategoryPresenter.playChooseNumerSound()
        
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
    
    private func setNumbersCategoryImages(){
        numbersCategoryPresenter.showNumbersBackground()
        numbersCategoryPresenter.showNumberArea()
        
        numbersCategoryPresenter.showOneBtnImage()
        numbersCategoryPresenter.showTwoBtnImage()
        numbersCategoryPresenter.showThreeBtnImage()
        numbersCategoryPresenter.showFourBtnImage()
        numbersCategoryPresenter.showFiveBtnImage()
        numbersCategoryPresenter.showSixBtnImage()
        numbersCategoryPresenter.showSevenBtnImage()
        numbersCategoryPresenter.showEightBtnImage()
        numbersCategoryPresenter.showNineBtnImage()
        numbersCategoryPresenter.showZeroBtnImage()
    }
    
    private func setButtonsTag(){
        zeroBtn.tag = TagNumber.zeroTag.rawValue
        oneBtn.tag = TagNumber.oneTag.rawValue
        twoBtn.tag = TagNumber.twoTag.rawValue
        threeBtn.tag = TagNumber.threeTag.rawValue
        fourBtn.tag = TagNumber.fourTag.rawValue
        fiveBtn.tag = TagNumber.fiveTag.rawValue
        sixBtn.tag = TagNumber.sixTag.rawValue
        sevenBtn.tag = TagNumber.sevenTag.rawValue
        eightBtn.tag = TagNumber.eightTag.rawValue
        nineBtn.tag = TagNumber.nineTag.rawValue
    }
    
    // MARK: - Actions
    @IBAction func btnPressed(_ sender: UIButton) {
        let indexTag = sender.tag
        guard let currentView = self.view else { return }
        numbersCategoryPresenter.tapOnTheSomeNumber(indexTag, sender, currentView)
        
    }
    
}

// MARK: - Extension NumbersCategoryViewProtocol
extension NumbersCategoryViewController: NumbersCategoryViewProtocol{
    func setNumbersBackground(_ image: UIImage) {
        imageNumbersBackground.image = image
    }
    
    func setNumberArea(_ image: UIImage) {
        imageNumberArea.image = image
    }
    
    func setOneBtnImage(_ image: UIImage) {
        oneBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setTwoBtnImage(_ image: UIImage) {
        twoBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setThreeBtnImage(_ image: UIImage) {
        threeBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setFourBtnImage(_ image: UIImage) {
        fourBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setFiveBtnImage(_ image: UIImage) {
        fiveBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setSixBtnImage(_ image: UIImage) {
        sixBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setSevenBtnImage(_ image: UIImage) {
        sevenBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setEightBtnImage(_ image: UIImage) {
        eightBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setNineBtnImage(_ image: UIImage) {
        nineBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setZeroBtnImage(_ image: UIImage) {
        zeroBtn.setBackgroundImage(image, for: .normal)
    }
}
