//
//  ReadSyllableCategoryTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 13/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockReadSyllableCategoryView: ReadSyllableCategoryViewProtocol{
    
    
    var generalBackgroundImageTest: UIImage!
    var syllablesImageTest: UIImage!
    var twoSyllablesImageTest: UIImage!
    var threeSyllablesImageTest: UIImage!
    var fourSyllablesImageTest: UIImage!
    
    func setGeneralBackgroundImage(_ image: UIImage) {
        generalBackgroundImageTest = image
    }
    
    func setSyllablesImage(_ image: UIImage) {
        syllablesImageTest = image
    }
    func set2SyllablesImage(_ image: UIImage) {
        twoSyllablesImageTest = image
    }
    func set3SyllablesImage(_ image: UIImage) {
        threeSyllablesImageTest = image
    }
    
}
class ReadSyllableCategoryModuleTest: XCTestCase {
    
    var model: ReadSyllableCategoryModel!
    var view: MockReadSyllableCategoryView!
    var presenter: ReadSyllableCategoryPresenter!
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assambly = AssamblyModuleBuilder()
    
    override func setUp() {
        self.model = ReadSyllableCategoryModel(generalBackFroundImage: #imageLiteral(resourceName: "ФонАзбукаТест"), syllablesImage: #imageLiteral(resourceName: "дом"), twoSyllablesImage: #imageLiteral(resourceName: "сачы"), threeSyllablesImage: #imageLiteral(resourceName: "корова"))
        self.view = MockReadSyllableCategoryView()
        self.router = Router(navigationController: navigationController, assamblyBuilder: assambly)
        self.presenter = ReadSyllableCategoryPresenter(view, model, router)
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
    
    func testShowGeneralBackFroundImage(){
        presenter.showGeneralBackgroundImage()
        XCTAssertEqual(view.generalBackgroundImageTest, #imageLiteral(resourceName: "ФонАзбукаТест"))
    }
    
    func testShowSyllablesImage(){
        presenter.showSyllablesImage()
        XCTAssertEqual(view.syllablesImageTest, #imageLiteral(resourceName: "дом"))
    }
    
    func testShowTwoSyllablesImage(){
        presenter.show2SyllablesImage()
        XCTAssertEqual(view.twoSyllablesImageTest, #imageLiteral(resourceName: "сачы"))
    }
    
    func testShowThreeSyllablesImage(){
        presenter.show3SyllablesImage()
        XCTAssertEqual(view.threeSyllablesImageTest, #imageLiteral(resourceName: "корова"))
    }
    
    
    func testModel(){
        XCTAssertEqual(self.model.generalBackFroundImage, #imageLiteral(resourceName: "ФонАзбукаТест"))
        XCTAssertEqual(self.model.syllablesImage, #imageLiteral(resourceName: "дом"))
        XCTAssertEqual(self.model.twoSyllablesImage, #imageLiteral(resourceName: "сачы"))
        XCTAssertEqual(self.model.threeSyllablesImage, #imageLiteral(resourceName: "корова"))
    }
    
}
