//
//  ABCModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 08/06/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid


class MockABCModuleView: ABCCategoryViewProtocol{
    
    var firstView: UIView!
    
    var pictureView: UIImageView!
    
    var factAnimalView: UIButton!
    var letterView: UIButton!
    
    var viewWithElementsBacgroundColor: UIColor!
    
    var backgroundABCCategoryImage: UIImage!
    var factAnimalButtonImage: UIImage!
    var letterButtonImage: UIImage!
    var pictureImage: UIImage!
    
    
    func setFirstView(_ view: UIView) {
        self.firstView = view
    }
    
    func setPictureView(_ imageView: UIImageView) {
        self.pictureView = imageView
    }
    
    func setFactAnimalView(_ button: UIButton) {
        self.factAnimalView = button
    }
    
    func setLetterView(_ button: UIButton) {
        self.letterView = button
    }
    
    func setViewWithElementsBacgroundColor(_ color: UIColor) {
        self.viewWithElementsBacgroundColor = color
    }
    
    func setFactAnimalButtonImage(_ image: UIImage) {
        self.factAnimalButtonImage = image
    }
    
    func setLetterButtonImage(_ image: UIImage) {
        self.letterButtonImage = image
    }
    
    func setPictureImage(_ image: UIImage) {
        self.pictureImage = image
    }
    
    func setBackgroundABCCategoryImage(_ image: UIImage) {
        backgroundABCCategoryImage = image
    }
}

class ABCModuleTest: XCTestCase {
    var view: MockABCModuleView!
    var model: ABCCategoryModel!
    var presenter: ABCCategoryPresenter!
//    var router: RouterProtocol!
//    var navigationController = MockNavigationController()
//    let assambly = AssamblyModuleBuilder()
    
    override func setUp() {
        self.model = ABCCategoryModel(backgroundImage: #imageLiteral(resourceName: "backgroundAndClouds"))
        self.view = MockABCModuleView()
//        self.router = Router(navigationController: navigationController, assamblyBuilder: assambly)
        self.presenter = ABCCategoryPresenter(view, model)
        
    }

    override func tearDown() {
        self.model = nil
        self.view = nil
        self.presenter = nil
//        self.router = nil
    }
    
    func testModuleIsNotNil(){
        XCTAssertNotNil(self.model, MODEL_IS_NOT_NIL)
        XCTAssertNotNil(self.view, VIEW_IS_NOT_NIL)
        XCTAssertNotNil(self.presenter, PRESENTER_IS_NOT_NIL)
//        XCTAssertNotNil(self.router, ROUTER_IS_NOT_NIL)
    }
    
    func testShowABCBackgroundImage(){
        presenter.showBackgroundABC()
        XCTAssertEqual(view.backgroundABCCategoryImage, #imageLiteral(resourceName: "backgroundAndClouds"))
    }
    
   
    func testViewWithElementsBacgroundColor(){
        presenter.showViewWithElementsBacgroundColor()
        XCTAssertEqual(view.viewWithElementsBacgroundColor, UIColor.clear)
    }
    
    func testFactAnimalButtonImage(){
        presenter.showFactAnimalButtonImage()
        XCTAssertEqual(view.factAnimalButtonImage, #imageLiteral(resourceName: "лампочка"))
    }

    func testLetterButtonImage(){
        for index in 0..<presenter.arrayABCStructure.count{
            presenter.showLetterButtonImage(index)
            let currentLetterImage = presenter.arrayABCStructure[index].letterButtonImageName
            XCTAssertEqual(view.letterButtonImage, UIImage(named: currentLetterImage!))
        }
    }
    
    func testPictureImage(){
        for index in 0..<presenter.arrayABCStructure.count{
            presenter.showPictureImage(index)
            let currentPictureImage = presenter.arrayABCStructure[index].pictureViewImageName
            XCTAssertEqual(view.pictureImage, UIImage(named: currentPictureImage!))
        }
    }
    
    func testFirstView(){
        for _ in 0..<presenter.arrayABCStructure.count{
            presenter.showFirstView()
           XCTAssertNotNil(view.firstView)
        }
    }
    
    func testPictureView(){
        for _ in 0..<presenter.arrayABCStructure.count{
            presenter.showPictureView()
           XCTAssertNotNil(view.pictureView)
        }
    }
    
    func testFactAnimalView(){
        for _ in 0..<presenter.arrayABCStructure.count{
            presenter.showFactAnimalView()
           XCTAssertNotNil(view.factAnimalView)
        }
    }
    
    func testLetterView(){
        for _ in 0..<presenter.arrayABCStructure.count{
            presenter.showLetterView()
           XCTAssertNotNil(view.letterView)
        }
    }
}
