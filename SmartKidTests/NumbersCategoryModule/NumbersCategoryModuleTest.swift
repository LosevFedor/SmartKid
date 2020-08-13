//
//  NumbersCategoryModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 02/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockNumbersCategoryView: NumbersCategoryViewProtocol {
    
    var numbersBackground: UIImage!
    var numberArea: UIImage!
    
    var oneBtnImage: UIImage!
    var twoBtnImage: UIImage!
    var threeBtnImage: UIImage!
    var fourBtnImage: UIImage!
    var fiveBtnImage: UIImage!
    var sixBtnImage: UIImage!
    var sevenBtnImage: UIImage!
    var eightBtnImage: UIImage!
    var nineBtnImage: UIImage!
    var zeroBtnImage: UIImage!
    
    func setNumbersBackground(_ image: UIImage){
        self.numbersBackground = image
    }
    func setNumberArea(_ image: UIImage){
        self.numberArea = image
    }
    
    func setOneBtnImage(_ image: UIImage){
        self.oneBtnImage = image
    }
    
    func setTwoBtnImage(_ image: UIImage){
        self.twoBtnImage = image
    }
    
    func setThreeBtnImage(_ image: UIImage){
        self.threeBtnImage = image
    }
    
    func setFourBtnImage(_ image: UIImage){
        self.fourBtnImage = image
    }
    
    func setFiveBtnImage(_ image: UIImage){
        self.fiveBtnImage = image
    }
    
    func setSixBtnImage(_ image: UIImage){
        self.sixBtnImage = image
    }
    
    func setSevenBtnImage(_ image: UIImage){
        self.sevenBtnImage = image
    }
    
    func setEightBtnImage(_ image: UIImage){
        self.eightBtnImage = image
    }
    
    func setNineBtnImage(_ image: UIImage){
        self.nineBtnImage = image
    }
    
    func setZeroBtnImage(_ image: UIImage){
        self.zeroBtnImage = image
    }
}

class NumbersCategoryModuleTest: XCTestCase{
    var model: NumbersModel!
    var view: MockNumbersCategoryView!
    var presenter: NumbersCategoryPresenter!
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assambly = AssamblyModuleBuilder()
    
    override func setUp() {
        self.model = NumbersModel(numbersBackground: #imageLiteral(resourceName: "numbersBackground"), numberArea: #imageLiteral(resourceName: "numberArea"), oneBtn: #imageLiteral(resourceName: "numberOneImage"), twoBtn: #imageLiteral(resourceName: "numberTwoImage"), threeBtn: #imageLiteral(resourceName: "numberThreeImage"), fourBtn: #imageLiteral(resourceName: "numberFourImage"), fiveBtn: #imageLiteral(resourceName: "numberFiveImage"), sixBtn: #imageLiteral(resourceName: "numberSixImage"), sevenBtn: #imageLiteral(resourceName: "numberSevenImage"), eightBtn: #imageLiteral(resourceName: "numberEightImage"), nineBtn: #imageLiteral(resourceName: "numberNineImage"), zeroBtn: #imageLiteral(resourceName: "numberZeroImage"))
        self.view = MockNumbersCategoryView()
        self.router = Router(navigationController: navigationController, assamblyBuilder: assambly)
        self.presenter = NumbersCategoryPresenter(view, model, router)
    }

    override func tearDown() {
        self.model = nil
        self.view = nil
        self.presenter = nil
    }
    
    func testModuleIsNotNil(){
        XCTAssertNotNil(self.model, MODEL_IS_NOT_NIL)
        XCTAssertNotNil(self.view, VIEW_IS_NOT_NIL)
        XCTAssertNotNil(self.presenter, PRESENTER_IS_NOT_NIL)
        XCTAssertNotNil(self.router, ROUTER_IS_NOT_NIL)
    }
    
    func testShowNumbersBackgroundImage(){
        presenter.showNumbersBackground()
        XCTAssertEqual(view.numbersBackground, #imageLiteral(resourceName: "numbersBackground"))
    }
    
    func testShowNumberAreaImage(){
        presenter.showNumberArea()
        XCTAssertEqual(view.numberArea, #imageLiteral(resourceName: "numberArea"))
    }
    
    func testShowOneBtnImage(){
        presenter.showOneBtnImage()
        XCTAssertEqual(view.oneBtnImage, #imageLiteral(resourceName: "numberOneImage"))
    }
    
    func testShowTwoBtnImage(){
        presenter.showTwoBtnImage()
        XCTAssertEqual(view.twoBtnImage, #imageLiteral(resourceName: "numberTwoImage"))
    }
    
    func testShowThreeBtnImage(){
        presenter.showThreeBtnImage()
        XCTAssertEqual(view.threeBtnImage, #imageLiteral(resourceName: "numberThreeImage"))
    }
    
    func testShowFourBtnImage(){
        presenter.showFourBtnImage()
        XCTAssertEqual(view.fourBtnImage, #imageLiteral(resourceName: "numberFourImage"))
    }
    
    func testShowFiveBtnImage(){
        presenter.showFiveBtnImage()
        XCTAssertEqual(view.fiveBtnImage, #imageLiteral(resourceName: "numberFiveImage"))
    }
    
    func testShowSixBtnImage(){
        presenter.showSixBtnImage()
        XCTAssertEqual(view.sixBtnImage, #imageLiteral(resourceName: "numberSixImage"))
    }
    
    func testShowSevenBtnImage(){
        presenter.showSevenBtnImage()
        XCTAssertEqual(view.sevenBtnImage, #imageLiteral(resourceName: "numberSevenImage"))
    }
    
    func testShowEightBtnImage(){
        presenter.showEightBtnImage()
        XCTAssertEqual(view.eightBtnImage, #imageLiteral(resourceName: "numberEightImage"))
    }
    
    func testShowNineBtnImage(){
        presenter.showNineBtnImage()
        XCTAssertEqual(view.nineBtnImage, #imageLiteral(resourceName: "numberNineImage"))
    }
    
    func testShowZeroBtnImage(){
        presenter.showZeroBtnImage()
        XCTAssertEqual(view.zeroBtnImage, #imageLiteral(resourceName: "numberZeroImage"))
    }
    
    
}
