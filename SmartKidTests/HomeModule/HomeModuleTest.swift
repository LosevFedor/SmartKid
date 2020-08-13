//
//  HomeModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 12/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockHomeView: HomeViewProtocol{
    
    var homeBackgroundImage: UIImage!
    var homeBackgroundCloudsImage: UIImage!
    var homeAppNameImage: UIImage!
    var homePlayButtonImage: UIImage!
    var homeSettingsButtonImage: UIImage!
    var cloud1Image: UIImage!
    var cloud2Image: UIImage!
    var cloud3Image: UIImage!
    var cloud4Image: UIImage!
    var cloud5Image: UIImage!
    var cloud6Image: UIImage!
    var resultImage: UIImage!
    
    var randomNameFirstIndex: Int!
    var randomNameSecondIndex: Int!
    var randomNameThirdIndex: Int!
    
    func setHomeBackgroundImage(_ image: UIImage) {
        homeBackgroundImage = image
    }
    
    func setHomeBackgroundCloudsImage(_ image: UIImage) {
        homeBackgroundCloudsImage = image
    }
    
    func setHomeAppNameImage(_ image: UIImage) {
        homeAppNameImage = image
    }
    
    func setHomePlayButtonImage(_ image: UIImage) {
        homePlayButtonImage = image
    }
    
    func setHomeSettingsButtonImage(_ image: UIImage) {
        homeSettingsButtonImage = image
    }
    
    func setCloud1Image(_ image: UIImage) {
        cloud1Image = image
    }
    
    func setCloud2Image(_ image: UIImage) {
        cloud2Image = image
    }
    
    func setCloud3Image(_ image: UIImage) {
        cloud3Image = image
    }
    
    func setCloud4Image(_ image: UIImage) {
        cloud4Image = image
    }
    
    func setCloud5Image(_ image: UIImage) {
        cloud5Image = image
    }
    
    func setCloud6Image(_ image: UIImage) {
        cloud6Image = image
    }
    
    func setResultImage(_ image: UIImage) {
        resultImage = image
    }
    
    func setRandomNameImageNumbers(firstIndex: Int, secondIndex: Int, thirdIndex: Int) {
        randomNameFirstIndex = firstIndex
        randomNameSecondIndex = secondIndex
        randomNameThirdIndex = thirdIndex
    }
}

class HomeModuleTest: XCTestCase {

    var model: HomeModel!
    var view: MockHomeView!
    var presenter: HomePresenter!
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assambly = AssamblyModuleBuilder()
    
    override func setUp() {
        self.model = HomeModel(homeBackgroundImage: #imageLiteral(resourceName: "generalBackground"), homeBackgroundCloudsImage: #imageLiteral(resourceName: "generalBackgroundClouds"), homeAppNameImage: #imageLiteral(resourceName: "appName"), homePlayButtonImage: #imageLiteral(resourceName: "playButton"), homeSettingsButtonImage: #imageLiteral(resourceName: "settingsButton"), cloud1: #imageLiteral(resourceName: "clouds1"), cloud2: #imageLiteral(resourceName: "clouds2"), cloud3: #imageLiteral(resourceName: "clouds3"), cloud4:#imageLiteral(resourceName: "clouds4") , cloud5: #imageLiteral(resourceName: "clouds5"), cloud6: #imageLiteral(resourceName: "clouds4"))
        self.view = MockHomeView()
        self.router = Router(navigationController: navigationController, assamblyBuilder: assambly)
        self.presenter = HomePresenter(view, model, router)
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
    
    
    func showHomeBackgroundImage(_ image: UIImage) {
        presenter.showHomeBackgroundImage()
        XCTAssertEqual(self.view.homeBackgroundImage, #imageLiteral(resourceName: "generalBackground"))
    }
    
    func showHomeBackgroundCloudsImage(_ image: UIImage) {
        presenter.showHomeBackgroundCloudsImage()
        XCTAssertEqual(self.view.homeBackgroundCloudsImage, #imageLiteral(resourceName: "generalBackgroundClouds"))
    }
    
    func showHomeAppNameImage(_ image: UIImage) {
        presenter.showHomeAppNameImage()
        XCTAssertEqual(self.view.homeAppNameImage, #imageLiteral(resourceName: "appName"))
    }
    
    func showHomePlayButtonImage(_ image: UIImage) {
        presenter.showHomePlayButtonImage()
        XCTAssertEqual(self.view.homePlayButtonImage, #imageLiteral(resourceName: "playButton"))
    }
    
    func showHomeSettingsButtonImage(_ image: UIImage) {
        presenter.showHomeSettingsButtonImage()
        XCTAssertEqual(self.view.homeSettingsButtonImage, #imageLiteral(resourceName: "settingsButton"))
        
    }
    
    func showCloud1Image(_ image: UIImage) {
        presenter.showCloud1Image()
        XCTAssertEqual(self.view.cloud1Image, #imageLiteral(resourceName: "clouds1"))
    }
    
    func showCloud2Image(_ image: UIImage) {
        presenter.showCloud2Image()
        XCTAssertEqual(self.view.cloud2Image, #imageLiteral(resourceName: "clouds2"))
    }
    
    func showCloud3Image(_ image: UIImage) {
        presenter.showCloud3Image()
        XCTAssertEqual(self.view.cloud3Image, #imageLiteral(resourceName: "clouds3"))
    }
    
    func showCloud4Image(_ image: UIImage) {
        presenter.showCloud4Image()
        XCTAssertEqual(self.view.cloud4Image, #imageLiteral(resourceName: "clouds5"))
    }
    
    func showCloud5Image(_ image: UIImage) {
        presenter.showCloud5Image()
        XCTAssertEqual(self.view.cloud5Image, #imageLiteral(resourceName: "clouds5"))
    }
    
    func showCloud6Image(_ image: UIImage) {
        presenter.showCloud6Image()
        XCTAssertEqual(self.view.cloud6Image, #imageLiteral(resourceName: "clouds4"))
    }
}
