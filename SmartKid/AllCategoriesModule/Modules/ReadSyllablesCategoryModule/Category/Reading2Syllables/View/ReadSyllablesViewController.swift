//
//  ReadSyllablesViewController.swift
//  SmartKid
//
//  Created by Fedor Losev on 13/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit
import Foundation
import SpriteKit

class ReadSyllablesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var generalBackgroundImage: UIImageView!
    @IBOutlet weak var syllableOneBtn: UIButton!
    @IBOutlet weak var syllableTwoBtn: UIButton!
    
    @IBOutlet weak var spriteKitView: SKView!
    @IBOutlet weak var currentImage: UIImageView!
    
    
    // MARK: - Internal property
    internal var readSyllablesPresenter: ReadSyllablesViewPresenterProtocol!
    
    // MARK: - Private property
    private var gameScene: GameScene!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showSKView()
        showImages()
        showTitles()
        
        setNavigationBarButtonItem()
        
    }
    
    @objc func handlerBack(sender: UIBarButtonItem) {
        let currentScene = gameScene.getCurrentScene()
        currentScene.removeAllPerform()
        _ = navigationController?.popViewController(animated: true)
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
        readSyllablesPresenter.showGeneralBackgroundImage()
        readSyllablesPresenter.showOneButtonImage()
        readSyllablesPresenter.showTwoButtonImage()
        readSyllablesPresenter.showCurrentImage(cyrrentCountGame: GameScene.currentReadingSyllableScene, isHudenImage: true)
    }
    
    private func showTitles(){
        readSyllablesPresenter.showSyllableOneBtnTitle(cyrrentCountGame: GameScene.currentReadingSyllableScene)
        readSyllablesPresenter.showSyllableTwoBtnTitle(cyrrentCountGame: GameScene.currentReadingSyllableScene)
    }
    
    private func showSKView(){
        let wSize = UIScreen.main.bounds.size.width
        let hSize = UIScreen.main.bounds.size.height
        gameScene = GameScene(size: CGSize(width: wSize, height: hSize))
        readSyllablesPresenter.showSpriteKitView(scene: gameScene, view: spriteKitView, outletImage: currentImage, outletOneButton: syllableOneBtn, outletTwoButton: syllableTwoBtn)
    }
    
    // MARK: - Actions
    @IBAction func sillableOneBtnPressed(_ sender: UIButton) {
        readSyllablesPresenter.playSoundSyllableOne(cyrrentCountGame: GameScene.currentReadingSyllableScene)
    }
    
    @IBAction func sillableTwoBtnPressed(_ sender: UIButton) {
        readSyllablesPresenter.playSoundSyllableTwo(cyrrentCountGame: GameScene.currentReadingSyllableScene)
    }
    
}

// MARK: - Extension
extension ReadSyllablesViewController: ReadSyllablesViewProtocol{
    func setGeneralBackgroundImage(image: UIImage){
        generalBackgroundImage.image = image
    }
    
    func setSyllableOneBtnTitle(text: String){
        syllableOneBtn.setTitle(text, for: .normal)
    }
    
    func setSyllableTwoBtnTitle(text: String){
        syllableTwoBtn.setTitle(text, for: .normal)
    }
    
    func setCurrentImage(image: String){
        currentImage.image = UIImage(named: image)
    }
    
    func setOneButtonImage(image: UIImage){
        syllableOneBtn.setBackgroundImage(image, for: .normal)
    }
    
    func setTwoButtonImage(image: UIImage){
        syllableTwoBtn.setBackgroundImage(image, for: .normal)
    }
}

