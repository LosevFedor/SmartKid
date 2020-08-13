//
//  Read3SyllablesViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 11/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import SpriteKit

class Read3SyllablesViewController: UIViewController {
    
    @IBOutlet weak var generalBackground: UIImageView!
    @IBOutlet weak var oneSyllableButton: UIButton!
    @IBOutlet weak var twoSyllableButton: UIButton!
    @IBOutlet weak var threeSyllableButton: UIButton!
    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var imageSyllable: UIImageView!
    
    // MARK: - Internal property
    internal var read3SyllablesPresenter: Read3SyllablesViewPresenterProtocol!
    
    // MARK: - Private property
    private var gameScene: GameScene3!
    
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
        read3SyllablesPresenter.showGeneralBackgroundImage()
        read3SyllablesPresenter.showOneButtonImage()
        read3SyllablesPresenter.showTwoButtonImage()
        read3SyllablesPresenter.showThreeButtonImage()
        read3SyllablesPresenter.showCurrentImage(cyrrentCountGame: GameScene3.currentGameScene, isHudenImage: true)
    }
    
    private func showTitles(){
        read3SyllablesPresenter.showSyllableOneBtnTitle(GameScene3.currentGameScene)
        read3SyllablesPresenter.showSyllableTwoBtnTitle(GameScene3.currentGameScene)
        read3SyllablesPresenter.showSyllableThreeBtnTitle(GameScene3.currentGameScene)
    }
    
    private func showSKView(){
        let wSize = UIScreen.main.bounds.size.width
        let hSize = UIScreen.main.bounds.size.height
        gameScene = GameScene3(size: CGSize(width: wSize, height: hSize))
        read3SyllablesPresenter.showSpriteKitView(gameScene, skView, imageSyllable, oneSyllableButton, twoSyllableButton, threeSyllableButton)
    }
    
    //MARK: - Actions
    @IBAction func oneSyllableBtnPressed(_ sender: Any) {
         read3SyllablesPresenter.playSoundSyllableOne(cyrrentCountGame: GameScene3.currentGameScene)
    }
    
    @IBAction func twoSyllableBtnPressed(_ sender: Any) {
        read3SyllablesPresenter.playSoundSyllableTwo(cyrrentCountGame: GameScene3.currentGameScene)
    }
    
    @IBAction func threeSyllableBtnPressed(_ sender: Any) {
        read3SyllablesPresenter.playSoundSyllableThree(cyrrentCountGame: GameScene3.currentGameScene)
    }
}


// MARK: - Extension
extension Read3SyllablesViewController: Read3SyllablesViewProtocol{
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
    
    func setSyllableThreeBtnTitle(text: String){
        threeSyllableButton.setTitle(text, for: .normal)
        threeSyllableButton.titleLabel?.font = threeSyllableButton.getFontForButtons()
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
    
    func setThreeButtonImage(image: UIImage){
        threeSyllableButton.setBackgroundImage(image, for: .normal)
    }
}
