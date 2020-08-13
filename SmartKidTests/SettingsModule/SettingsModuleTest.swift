//
//  SettingsModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 12/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockSettingsView: SettingsViewProtocol{
    var generalBackgroundImage: UIImage!
    var generalBackgroundCloudsImage: UIImage!
    var imageInscriptionsSounds: UIImage!
    var imageInscriptionsContacts: UIImage!
    var instagramImage: UIImage!
    var vkontacteImage: UIImage!
    var telegramImage: UIImage!
    var facebookImage: UIImage!
    var melodyOnImage: UIImage!
    var soundOnImage: UIImage!
    var cloud1Image: UIImage!
    var cloud2Image: UIImage!
    var cloud3Image: UIImage!
    var cloud4Image: UIImage!
    var dashesImage: UIImage!
    
    func setGeneralBackgroundImage(image: UIImage) {
        generalBackgroundImage = image
    }
    
    func setGeneralBackgroundCloudsImage(image: UIImage) {
        generalBackgroundCloudsImage = image
    }
    
    func setImageInscriptionsSounds(image: UIImage) {
        imageInscriptionsSounds = image
    }
    
    func setimageInscriptionsContacts(image: UIImage) {
        imageInscriptionsContacts = image
    }
    
    func setInstagramImage(image: UIImage) {
        instagramImage = image
    }
    
    func setVkontacteImage(image: UIImage) {
        vkontacteImage = image
    }
    
    func setTelegramImage(image: UIImage) {
        telegramImage = image
    }
    
    func setFacebookImage(image: UIImage) {
        facebookImage = image
    }
    
    func setMelodyOnImage(image: UIImage) {
        melodyOnImage = image
    }
    
    func setSoundOnImage(image: UIImage) {
        soundOnImage = image
    }
    
    func setCloud1Image(image: UIImage) {
        cloud1Image = image
    }
    
    func setCloud2Image(image: UIImage) {
        cloud2Image = image
    }
    
    func setCloud3Image(image: UIImage) {
        cloud3Image = image
    }
    
    func setCloud4Image(image: UIImage) {
        cloud4Image = image
    }
    
    func setDashesImage(image: UIImage) {
        dashesImage = image
    }
}

class SettingsModuleTest: XCTestCase {

    var view: MockSettingsView!
    var model: SettingsModel!
    var presenter: SettingsPresenter!
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assambly = AssamblyModuleBuilder()
    
    
    override func setUp() {
        self.model = SettingsModel(generalBackgroundImage: #imageLiteral(resourceName: "generalBackground"), generalBackgroundCloudsImage: #imageLiteral(resourceName: "settingsGeneralBackgroundClouds"), imageInscriptionsSounds: #imageLiteral(resourceName: "imageInscriptionsSounds"), imageInscriptionsContacts: #imageLiteral(resourceName: "imageInscriptionsContacts"),  instagramImage: #imageLiteral(resourceName: "instagramButton"), vkontacteImage: #imageLiteral(resourceName: "vkontakteButton"), telegramImage: #imageLiteral(resourceName: "telegramButton"), facebookImage: #imageLiteral(resourceName: "facebookButton"), melodyOnImage: #imageLiteral(resourceName: "melodyOnButton"), soundOnImage: #imageLiteral(resourceName: "soundOnButton"), cloud1Image: #imageLiteral(resourceName: "settingsCloud1"), cloud2Image: #imageLiteral(resourceName: "settingsCloud2"), cloud3Image:  #imageLiteral(resourceName: "settingsCloud3"), cloud4Image: #imageLiteral(resourceName: "settingsCloud4"), dashesImage:  #imageLiteral(resourceName: "dashes"))
        self.view = MockSettingsView()
        self.router = Router(navigationController: navigationController, assamblyBuilder: assambly)
        self.presenter = SettingsPresenter(view, model, router)
        
    }

    override func tearDown() {
        self.model = nil
        self.view = nil
        self.presenter = nil
        self.router = nil
    }
    
    func testModuleIsNotNil(){
        XCTAssertNotNil(self.model, MODEL_IS_NOT_NIL)
        XCTAssertNotNil(self.view, VIEW_IS_NOT_NIL)
        XCTAssertNotNil(self.presenter, PRESENTER_IS_NOT_NIL)
        XCTAssertNotNil(self.router, ROUTER_IS_NOT_NIL)
    }
    
    func testShowGeneralBackgroundImage(){
        presenter.showGeneralBackgroundImage()
        XCTAssertEqual(self.view.generalBackgroundImage, #imageLiteral(resourceName: "generalBackground"))
    }
    
    func testShowGeneralBackgroundCloudsImage(){
        presenter.showGeneralBackgroundCloudsImage()
        XCTAssertEqual(self.view.generalBackgroundCloudsImage, #imageLiteral(resourceName: "settingsGeneralBackgroundClouds"))
    }
    
    func testShowImageInscriptionsSounds(image: UIImage) {
        presenter.showImageInscriptionsSounds()
        XCTAssertEqual(self.view.imageInscriptionsSounds, #imageLiteral(resourceName: "imageInscriptionsSounds"))
    }
    
    func testShowImageInscriptionsContacts(image: UIImage) {
        presenter.showImageInscriptionsContacts()
        XCTAssertEqual(self.view.imageInscriptionsContacts, #imageLiteral(resourceName: "imageInscriptionsContacts"))
    }
    
    func testShowInstagramImage(image: UIImage) {
        presenter.showInstagramImage()
        XCTAssertEqual(self.view.instagramImage, #imageLiteral(resourceName: "instagramButton"))
    }
    
    func testShowVkontacteImage(image: UIImage) {
        presenter.showVkontacteImage()
        XCTAssertEqual(self.view.vkontacteImage, #imageLiteral(resourceName: "vkontakteButton"))
    }
    
    func testShowTelegramImage(image: UIImage) {
        presenter.showTelegramImage()
        XCTAssertEqual(self.view.telegramImage, #imageLiteral(resourceName: "telegramButton"))
    }
    
    func testShowFacebookImage(image: UIImage) {
        presenter.showFacebookImage()
        XCTAssertEqual(self.view.facebookImage, #imageLiteral(resourceName: "facebookButton"))
    }
    
    func testShowMelodyOnImage(image: UIImage) {
        presenter.showMelodyOnImage()
        XCTAssertEqual(self.view.melodyOnImage, #imageLiteral(resourceName: "melodyOnButton"))
    }
    
    func testShowSoundOnImage(image: UIImage) {
        presenter.showSoundOnImage()
        XCTAssertEqual(self.view.soundOnImage,#imageLiteral(resourceName: "soundOnButton"))
    }
    
    func testShowCloud1Image(image: UIImage) {
        presenter.showCloud1Image()
        XCTAssertEqual(self.view.cloud1Image, #imageLiteral(resourceName: "settingsCloud1"))
    }
    
    func stestShowCloud2Image(image: UIImage) {
        presenter.showCloud2Image()
        XCTAssertEqual(self.view.cloud2Image, #imageLiteral(resourceName: "settingsCloud2"))
    }
    
    func testShowCloud3Image(image: UIImage) {
        presenter.showCloud3Image()
        XCTAssertEqual(self.view.cloud3Image, #imageLiteral(resourceName: "settingsCloud3"))
    }
    
    func testShowCloud4Image(image: UIImage) {
        presenter.showCloud4Image()
        XCTAssertEqual(self.view.cloud4Image, #imageLiteral(resourceName: "settingsCloud4"))
    }
    
    func testShowDashesImage(image: UIImage) {
        presenter.showDashesImage()
        XCTAssertEqual(self.view.dashesImage, #imageLiteral(resourceName: "dashes"))
    }
    
}
