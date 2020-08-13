//
//  Read2SyllablesViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 09/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import SpriteKit

class Read2SyllablesViewController: UIViewController {
    @IBOutlet weak var generalBackground: UIImageView!
    @IBOutlet weak var oneSyllableButton: UIButton!
    @IBOutlet weak var twoSyllableButton: UIButton!
    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var imageSyllable: UIImageView!
    
    
    // MARK: - Internal property
    internal var read2SyllablesPresenter: Read2SyllablesViewPresenterProtocol!
    
    // MARK: - Private property
    private var gameScene: GameScene2!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSKView()
        showImages()
        showTitles()
        setNavigationBarButtonItem()
    }
    
    // MARK: - Hendlers
    @objc func handlerBack(sender: UIBarButtonItem) {
        let currentScene = gameScene.getCurrentScene()
        currentScene.removeAllPerform()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handlerMenuBack(sender: UIBarButtonItem){
        let currentScene = gameScene.getCurrentScene()
        currentScene.removeAllPerform()
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
    
    private func showImages(){
        read2SyllablesPresenter.showGeneralBackgroundImage()
        read2SyllablesPresenter.showOneButtonImage()
        read2SyllablesPresenter.showTwoButtonImage()
        read2SyllablesPresenter.showCurrentImage(cyrrentCountGame: GameScene2.currentGameScene, isHudenImage: true)
    }
    
    private func showTitles(){
        read2SyllablesPresenter.showSyllableOneBtnTitle(GameScene2.currentGameScene)
        read2SyllablesPresenter.showSyllableTwoBtnTitle(GameScene2.currentGameScene)
    }
    
    private func showSKView(){
        let wSize = UIScreen.main.bounds.size.width
        let hSize = UIScreen.main.bounds.size.height
        gameScene = GameScene2(size: CGSize(width: wSize, height: hSize))
        read2SyllablesPresenter.showSpriteKitView(scene: gameScene, view: skView, outletImage: imageSyllable, outletOneButton: oneSyllableButton, outletTwoButton: twoSyllableButton)
    }
    
    // MARK: - Actions
    @IBAction func oneSyllableBtnPressed(_ sender: Any) {
        read2SyllablesPresenter.playSoundSyllableOne(cyrrentCountGame: GameScene2.currentGameScene)
    }
    
    @IBAction func twoSyllableBtnPressed(_ sender: Any) {
        read2SyllablesPresenter.playSoundSyllableTwo(cyrrentCountGame: GameScene2.currentGameScene)
    }
    
}

// MARK: - Extension
extension Read2SyllablesViewController: Read2SyllablesViewProtocol{
    func setGeneralBackgroundImage(image: UIImage){
        generalBackground.image = image
    }
    
    func setSyllableOneBtnTitle(text: String){
        oneSyllableButton.setTitle(text, for: .normal)
        oneSyllableButton.titleLabel?.font = oneSyllableButton.getFontForButtons()
    }
    
    func setSyllableTwoBtnTitle(text: String){
        twoSyllableButton.setTitle(text, for: .normal)
        twoSyllableButton.titleLabel?.font = twoSyllableButton.getFontForButtons()
    }
    
    func setCurrentImage(image: String){
        imageSyllable.image = UIImage(named: image)
    }
    
    func setOneButtonImage(image: UIImage){
        oneSyllableButton.setBackgroundImage(image, for: .normal)
    }
    
    func setTwoButtonImage(image: UIImage){
        twoSyllableButton.setBackgroundImage(image, for: .normal)
    }
}
