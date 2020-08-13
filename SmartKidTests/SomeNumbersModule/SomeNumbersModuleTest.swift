//
//  SomeNumbersModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 02/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockSomeNumbersView: SomeNumbersViewProtocol{
    
    var backgrounSomeNumbersImage: UIImage!
    var someNumbersImage: UIImage!
    var someSketchNumberImage: UIImage!
    var someFingerNumberImage: UIImage!
    var drawingBoardImage: UIImage!
    var clearDravingBoardBtnImage: UIImage!
    var undoLastLineBtnImage: UIImage!
    var eraserColorBtnImage: UIImage!
    var strokeWidth20pxBtnImage: UIImage!
    var strokeWidth25pxBtnImage: UIImage!
    var strokeWidth30pxBtnImage: UIImage!
    var blueBtnImage: UIImage!
    var redBtnImage: UIImage!
    var greenBtnImage: UIImage!
    var yellowBtnImage: UIImage!
    var previousBtnImage: UIImage!
    var forwardBtnImage: UIImage!
    
    let currentTestIndex = 5
    
    var currentArrayNimbersImages = [UIImage]()
    var currentArraySkethNubersImages = [UIImage]()
    var currentArrayFingerNumberImage = [UIImage]()
    
    func setBackgrounSomeNumbersImage(_ image: UIImage) {
        backgrounSomeNumbersImage = image
    }
    
    func setSomeNumbersImage(_ image: UIImage) {
        someNumbersImage = image
    }
    
    func setSomeSketchNumberImage(_ image: UIImage) {
        someSketchNumberImage = image
    }
    
    func setSomeFingerNumberImage(_ image: UIImage) {
        someFingerNumberImage = image
    }
    
    func setDrawingBoardImage(_ image: UIImage) {
        drawingBoardImage = image
    }
    
    func setClearDravingBoardBtnImage(_ image: UIImage) {
        clearDravingBoardBtnImage = image
    }
    
    func setUndoLastLineBtnImage(_ image: UIImage) {
        undoLastLineBtnImage = image
    }
    
    func setEraserColorBtnImage(_ image: UIImage) {
        eraserColorBtnImage = image
    }
    
    func setStrokeWidth20pxBtnImage(_ image: UIImage) {
        strokeWidth20pxBtnImage = image
    }
    
    func setStrokeWidth25pxBtnImage(_ image: UIImage) {
        strokeWidth25pxBtnImage = image
    }
    
    func setStrokeWidth30pxBtnImage(_ image: UIImage) {
        strokeWidth30pxBtnImage = image
    }
    
    func setBlueBtnImage(_ image: UIImage) {
        blueBtnImage = image
    }
    
    func setRedBtnImage(_ image: UIImage) {
        redBtnImage = image
    }
    
    func setGreenBtnImage(_ image: UIImage) {
        greenBtnImage = image
    }
    
    func setYellowBtnImage(_ image: UIImage) {
        yellowBtnImage = image
    }
    
    func setPreviousNumber(_ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage], _ arrayFingerNumberImage: [UIImage]) -> Int {
        self.currentArrayNimbersImages = arrayNumbersImages
        self.currentArraySkethNubersImages = arraySkethNubersImages
        self.currentArrayFingerNumberImage = arrayFingerNumberImage
        
        return currentTestIndex
    }
    
    func setSecondNumber(_ arrayNumbersImages: [UIImage], _ arraySkethNubersImages: [UIImage], _ arrayFingerNumberImage: [UIImage]) -> Int {
        self.currentArrayNimbersImages = arrayNumbersImages
        self.currentArraySkethNubersImages = arraySkethNubersImages
        self.currentArrayFingerNumberImage = arrayFingerNumberImage
        
        return currentTestIndex
    }
    
    func setPreviousBtnImage(_ image: UIImage) {
        previousBtnImage = image
    }
    
    func setForwardBtnImage(_ image: UIImage) {
        forwardBtnImage = image
    }
    
}

class SomeNumbersModuleTest: XCTestCase{
    var model: SomeNumbersModel!
    var view: MockSomeNumbersView!
    var presenter: SomeNumbersPresenter!
    
    override func setUp() {
        self.model = SomeNumbersModel(backgrounNumbersImage: #imageLiteral(resourceName: "backgroundSomeNumberModule"),
                                      dravingBoardImage: #imageLiteral(resourceName: "drawingBoard"),
                                      clearDravingBoardBtnImage: #imageLiteral(resourceName: "brushBtn"),
                                      undoLastLineBtnImage: #imageLiteral(resourceName: "cancelActionBtn"),
                                      eraserColorBtnImage: #imageLiteral(resourceName: "eraserBtn"),
                                      strokeWidth20pxBtnImage: #imageLiteral(resourceName: "brushSize20"),
                                      strokeWidth25pxBtnImage: #imageLiteral(resourceName: "brushSize25"),
                                      strokeWidth30pxBtnImage: #imageLiteral(resourceName: "brushSize30"),
                                      blueBtnImage: #imageLiteral(resourceName: "pencilBlueBtn"),
                                      redBtnImage: #imageLiteral(resourceName: "pencilRedBtn"),
                                      greenBtnImage: #imageLiteral(resourceName: "pencilGreenBtn"),
                                      yellowBtnImage: #imageLiteral(resourceName: "pencilYellowBtn"),
                                      currentIndexNumber: 5)
        self.view = MockSomeNumbersView()
        self.presenter = SomeNumbersPresenter(view, model)
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
    }
    
    func testModel(){
        XCTAssertEqual(self.model.backgrounNumbersImage, #imageLiteral(resourceName: "backgroundSomeNumberModule"))
        XCTAssertEqual(self.model.dravingBoardImage, #imageLiteral(resourceName: "drawingBoard"))
        XCTAssertEqual(self.model.clearDravingBoardBtnImage, #imageLiteral(resourceName: "brushBtn"))
        XCTAssertEqual(self.model.undoLastLineBtnImage, #imageLiteral(resourceName: "cancelActionBtn"))
        XCTAssertEqual(self.model.eraserColorBtnImage, #imageLiteral(resourceName: "eraserBtn"))
        XCTAssertEqual(self.model.strokeWidth20pxBtnImage, #imageLiteral(resourceName: "brushSize20"))
        XCTAssertEqual(self.model.strokeWidth25pxBtnImage, #imageLiteral(resourceName: "brushSize25"))
        XCTAssertEqual(self.model.strokeWidth30pxBtnImage, #imageLiteral(resourceName: "brushSize30"))
        XCTAssertEqual(self.model.blueBtnImage, #imageLiteral(resourceName: "pencilBlueBtn"))
        XCTAssertEqual(self.model.redBtnImage, #imageLiteral(resourceName: "pencilRedBtn"))
        XCTAssertEqual(self.model.greenBtnImage, #imageLiteral(resourceName: "pencilGreenBtn"))
        XCTAssertEqual(self.model.yellowBtnImage, #imageLiteral(resourceName: "pencilYellowBtn"))
        XCTAssertEqual(self.model.currentIndexNumber, 5)
    }
    
    func testShowBackgrounSomeNumbersImage() {
        presenter.showBackgrounSomeNumbersImage()
        XCTAssertEqual(view.backgrounSomeNumbersImage, #imageLiteral(resourceName: "backgroundSomeNumberModule"))
    }
    
    func testShowSomeNumbersImage() {
        presenter.showSomeNumbersImage()
        XCTAssertEqual(view.someNumbersImage, #imageLiteral(resourceName: "numberFiveImage"))
    }
    
    func testShowSomeSketchNumberImage() {
        presenter.showSomeSketchNumberImage()
        XCTAssertEqual(view.someSketchNumberImage, #imageLiteral(resourceName: "sketchNumberFive"))
    }
    
    func testShowSomeFingerNumberImage() {
        presenter.showSomeFingerNumberImage()
        XCTAssertEqual(view.someFingerNumberImage, #imageLiteral(resourceName: "pictureFiveFingers"))
    }
    
    func testShowDrawingBoardImage() {
        presenter.showDrawingBoardImage()
        XCTAssertEqual(view.drawingBoardImage, #imageLiteral(resourceName: "drawingBoard"))
    }
    
    func testShowClearDravingBoardBtnImage() {
        presenter.showClearDravingBoardBtnImage()
        XCTAssertEqual(view.clearDravingBoardBtnImage, #imageLiteral(resourceName: "brushBtn"))
    }
    
    func testShowUndoLastLineBtnImage() {
        presenter.showUndoLastLineBtnImage()
        XCTAssertEqual(view.undoLastLineBtnImage, #imageLiteral(resourceName: "cancelActionBtn"))
    }
    
    func testShowEraserColorBtnImage() {
        presenter.showEraserColorBtnImage()
        XCTAssertEqual(view.eraserColorBtnImage, #imageLiteral(resourceName: "eraserBtn"))
    }
    
    func testShowStrokeWidth20pxBtnImage() {
        presenter.showStrokeWidth20pxBtnImage()
        XCTAssertEqual(view.strokeWidth20pxBtnImage, #imageLiteral(resourceName: "brushSize20"))
    }
    
    func testShowStrokeWidth25pxBtnImage() {
        presenter.showStrokeWidth25pxBtnImage()
        XCTAssertEqual(view.strokeWidth25pxBtnImage, #imageLiteral(resourceName: "brushSize25"))
    }
    
    func testShowStrokeWidth30pxBtnImage() {
        presenter.showStrokeWidth30pxBtnImage()
        XCTAssertEqual(view.strokeWidth30pxBtnImage, #imageLiteral(resourceName: "brushSize30"))
    }
    
    func testShowBlueBtnImage() {
        presenter.showBlueBtnImage()
        XCTAssertEqual(view.blueBtnImage, #imageLiteral(resourceName: "pencilBlueBtn"))
    }
    
    func testShowRedBtnImage() {
        presenter.showRedBtnImage()
        XCTAssertEqual(view.redBtnImage, #imageLiteral(resourceName: "pencilRedBtn"))
    }
    
    func testShowGreenBtnImage() {
        presenter.showGreenBtnImage()
        XCTAssertEqual(view.greenBtnImage, #imageLiteral(resourceName: "pencilGreenBtn"))
    }
    
    func testShowYellowBtnImage() {
        presenter.showYellowBtnImage()
        XCTAssertEqual(view.yellowBtnImage, #imageLiteral(resourceName: "pencilYellowBtn"))
    }
    
    func testShowPreviousNumber(){
        presenter.showPreviousNumber()
        
        XCTAssertEqual(self.model.backgrounNumbersImage, #imageLiteral(resourceName: "backgroundSomeNumberModule"))
        XCTAssertEqual(self.model.dravingBoardImage, #imageLiteral(resourceName: "drawingBoard"))
        XCTAssertEqual(self.model.clearDravingBoardBtnImage, #imageLiteral(resourceName: "brushBtn"))
        XCTAssertEqual(self.model.undoLastLineBtnImage, #imageLiteral(resourceName: "cancelActionBtn"))
        XCTAssertEqual(self.model.eraserColorBtnImage, #imageLiteral(resourceName: "eraserBtn"))
        XCTAssertEqual(self.model.strokeWidth20pxBtnImage, #imageLiteral(resourceName: "brushSize20"))
        XCTAssertEqual(self.model.strokeWidth25pxBtnImage, #imageLiteral(resourceName: "brushSize25"))
        XCTAssertEqual(self.model.strokeWidth30pxBtnImage, #imageLiteral(resourceName: "brushSize30"))
        XCTAssertEqual(self.model.blueBtnImage, #imageLiteral(resourceName: "pencilBlueBtn"))
        XCTAssertEqual(self.model.redBtnImage, #imageLiteral(resourceName: "pencilRedBtn"))
        XCTAssertEqual(self.model.greenBtnImage, #imageLiteral(resourceName: "pencilGreenBtn"))
        XCTAssertEqual(self.model.yellowBtnImage, #imageLiteral(resourceName: "pencilYellowBtn"))
        
        XCTAssertEqual(view.currentArrayNimbersImages[4], #imageLiteral(resourceName: "numberFourImage"))
        XCTAssertEqual(view.currentArraySkethNubersImages[4], #imageLiteral(resourceName: "sketchNumberFour"))
        XCTAssertEqual(view.currentArrayFingerNumberImage[4], #imageLiteral(resourceName: "pictureFourFingers"))
        XCTAssertEqual(view.previousBtnImage , #imageLiteral(resourceName: "backBtnFour"))
        
    }
    
    func testShowForwardNumber(){
        presenter.showPreviousNumber()
        
        XCTAssertEqual(self.model.backgrounNumbersImage, #imageLiteral(resourceName: "backgroundSomeNumberModule"))
        XCTAssertEqual(self.model.dravingBoardImage, #imageLiteral(resourceName: "drawingBoard"))
        XCTAssertEqual(self.model.clearDravingBoardBtnImage, #imageLiteral(resourceName: "brushBtn"))
        XCTAssertEqual(self.model.undoLastLineBtnImage, #imageLiteral(resourceName: "cancelActionBtn"))
        XCTAssertEqual(self.model.eraserColorBtnImage, #imageLiteral(resourceName: "eraserBtn"))
        XCTAssertEqual(self.model.strokeWidth20pxBtnImage, #imageLiteral(resourceName: "brushSize20"))
        XCTAssertEqual(self.model.strokeWidth25pxBtnImage, #imageLiteral(resourceName: "brushSize25"))
        XCTAssertEqual(self.model.strokeWidth30pxBtnImage, #imageLiteral(resourceName: "brushSize30"))
        XCTAssertEqual(self.model.blueBtnImage, #imageLiteral(resourceName: "pencilBlueBtn"))
        XCTAssertEqual(self.model.redBtnImage, #imageLiteral(resourceName: "pencilRedBtn"))
        XCTAssertEqual(self.model.greenBtnImage, #imageLiteral(resourceName: "pencilGreenBtn"))
        XCTAssertEqual(self.model.yellowBtnImage, #imageLiteral(resourceName: "pencilYellowBtn"))
        
        XCTAssertEqual(view.currentArrayNimbersImages[6], #imageLiteral(resourceName: "numberSixImage"))
        XCTAssertEqual(view.currentArraySkethNubersImages[6], #imageLiteral(resourceName: "sketchNumberSix"))
        XCTAssertEqual(view.currentArrayFingerNumberImage[6], #imageLiteral(resourceName: "pictureSixFingers"))
        XCTAssertEqual(view.previousBtnImage , #imageLiteral(resourceName: "backBtnFour"))
        
    }
    
    func testShowPreviousBtnImage() {
        presenter.showPreviousNumber()
        XCTAssertEqual(view.previousBtnImage , #imageLiteral(resourceName: "backBtnFour"))
    }
    
    func testShowForwardBtnImage() {
        presenter.showForwardBtnImage()
        XCTAssertEqual(view.forwardBtnImage , #imageLiteral(resourceName: "forwardBtnSix"))
        
    }
}
