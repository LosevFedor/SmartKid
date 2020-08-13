//
//  AdditionAndSubtractionModuleTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 20/06/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockAdditionAndSubtractionModuleView: AdditionAndSubtractionViewProtocol{
    
    var generalBackground: UIImage!
    var firstPictureImage: UIImage!
    var characterPictureImage: UIImage!
    var secondPictureImage: UIImage!
    var equalPictureImage: UIImage!
    var answerPictureImage: UIImage!
    var answerNumberImage: UIImage!
    var firstBackgroundNumberImage: UIImage!
    var firstNumberVariantAnswer: UIImage!
    var secondBackgroundNumberImage: UIImage!
    var secondNumberVariantAnswer: UIImage!
    var thirdBackgroundNumberImage: UIImage!
    var thirdNumberVariantAnswer: UIImage!
    var nextExampleImage: UIImage!
    var firstBtnNumberImage: UIImage!
    var secondBtnNumberImage: UIImage!
    
    func setGeneralBackground(_ image: UIImage) {
        self.generalBackground = image
    }
    
    func setFirstPictureImage(_ image: UIImage) {
        self.firstPictureImage = image
    }
    
    func setCharacterPictureImage(_ image: UIImage) {
        self.characterPictureImage = image
    }
    
    func setSecondPictureImage(_ image: UIImage) {
        self.secondPictureImage = image
    }
    
    func setEqualPictureImage(_ image: UIImage) {
        self.equalPictureImage = image
    }
    
    func setAnswerPictureImage(_ image: UIImage) {
        self.answerPictureImage = image
    }
    
    func setAnswerNumberImage(_ image: UIImage) {
        self.answerNumberImage = image
    }
    
    func setFirstBackgroundNumberImage(_ image: UIImage) {
        self.firstBackgroundNumberImage = image
    }
    
    func setFirstNumberVariantAnswer(_ image: UIImage) {
        self.firstNumberVariantAnswer = image
    }
    
    func setSecondBackgroundNumberImage(_ image: UIImage) {
        self.secondBackgroundNumberImage = image
    }
    
    func setSecondNumberVariantAnswer(_ image: UIImage) {
        self.secondNumberVariantAnswer = image
    }
    
    func setThirdBackgroundNumberImage(_ image: UIImage) {
        self.thirdBackgroundNumberImage = image
    }
    
    func setThirdNumberVariantAnswer(_ image: UIImage) {
        self.thirdNumberVariantAnswer = image
    }
    
    func setNextExampleImage(_ image: UIImage) {
        self.nextExampleImage = image
    }
    
    func setFirstBtnNumberImage(_ image: UIImage) {
        self.firstBtnNumberImage = image
    }
    
    func setSecondBtnNumberImage(_ image: UIImage) {
        self.secondBtnNumberImage = image
    }
}

class AdditionAndSubtractionModuleTest: XCTestCase {
    var view: MockAdditionAndSubtractionModuleView!
    var model: AdditionAndSubtractionModel!
    var presenter: AdditionAndSubtractionPresenter!

    override func setUp() {
        let mockDict = getDictionaryAditionAndSubtractionPlist()
        self.model = AdditionAndSubtractionModel(dictionaryAditionAndSubtraction: mockDict,
                                                 generalBackground: #imageLiteral(resourceName: "backgroundAndClouds"),
                                                 equalImage: #imageLiteral(resourceName: "равно"),
                                                 answerNumberImage: #imageLiteral(resourceName: "вопрос"),
                                                 nextExampleImage: #imageLiteral(resourceName: "forward"))
        self.view = MockAdditionAndSubtractionModuleView()
        self.presenter = AdditionAndSubtractionPresenter(view: view, model: model)
        
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
    
    func testShowGeneralBackground(){
        presenter.showGeneralBackground()
        XCTAssertEqual(view.generalBackground, #imageLiteral(resourceName: "backgroundAndClouds"))
    }
    
    func testEqualPictureImage(){
        presenter.showEqualPictureImage()
        XCTAssertEqual(view.equalPictureImage, #imageLiteral(resourceName: "равно"))
    }
    
    func testAnswerNumberImage(){
        presenter.showAnswerNumberImage()
        XCTAssertEqual(view.answerNumberImage, #imageLiteral(resourceName: "вопрос"))
    }
    
    func testNextExampleImage(){
        presenter.showNextExampleImage()
        XCTAssertEqual(view.nextExampleImage, #imageLiteral(resourceName: "forward"))
    }
    
    func testCheckByNillFirstPictureImage(){
        presenter.showFirstPictureImage()
        XCTAssertNotNil(view.firstPictureImage)
    }
    
    func testCheckByNillCharacterPictureImage(){
        presenter.showCharacterPictureImage()
        XCTAssertNotNil(view.characterPictureImage)
    }
    
    func testCheckByNillSecondPictureImage(){
        presenter.showSecondPictureImage()
        XCTAssertNotNil(view.secondPictureImage)
    }
    
    func testCheckByNillAnswerPictureImage(){
        presenter.showAnswerPictureImage()
        XCTAssertNotNil(view.answerPictureImage)
    }
    
    func testCheckByNillFirstBackgroundNumberImage(){
        presenter.showFirstBackgroundNumberImage()
        XCTAssertNotNil(view.firstBackgroundNumberImage)
    }
    
    func testCheckByNillFirstNumberVariantAnswer(){
        presenter.showFirstNumberVariantAnswer()
        XCTAssertNotNil(view.firstNumberVariantAnswer)
    }
    
    func testCheckByNillSecondBackgroundNumberImage(){
        presenter.showSecondBackgroundNumberImage()
        XCTAssertNotNil(view.secondBackgroundNumberImage)
    }
    
    func testCheckByNillSecondNumberVariantAnswer(){
        presenter.showSecondNumberVariantAnswer()
        XCTAssertNotNil(view.secondNumberVariantAnswer)
    }
    
    func testCheckByNillThirdBackgroundNumberImage(){
        presenter.showThirdBackgroundNumberImage()
        XCTAssertNotNil(view.thirdBackgroundNumberImage)
    }
    
    func testCheckByNillThirdNumberVariantAnswer(){
        presenter.showThirdNumberVariantAnswer()
        XCTAssertNotNil(view.thirdNumberVariantAnswer)
    }
    
    func testCheckByNillFirstBtnNumberImage(){
        presenter.showFirstBtnNumberImage()
        XCTAssertNotNil(view.firstBtnNumberImage)
    }
    
    func testCheckByNillSecondBtnNumberImage(){
        presenter.showSecondBtnNumberImage()
        XCTAssertNotNil(view.secondBtnNumberImage)
    }
    
    func testCheckByNillWinnerSound(){
        XCTAssertNotNil(presenter.playWinnerSound())
    }
    
    func testCheckByNillLooseSound(){
        XCTAssertNotNil(presenter.playLoseSound())
    }
    
    func testCheckByNillFirstPictureSound(){
        XCTAssertNotNil(presenter.playFirstPictureSound)
    }
    
    func testCheckByNillCharacterPictureSound(){
        XCTAssertNotNil(presenter.playCharacterPictureSound)
    }
    
    func testCheckByNillSecondPictureSound(){
        XCTAssertNotNil(presenter.playSecondPictureSound)
    }
    
    func testCheckByNillEqualPictureSound(){
        XCTAssertNotNil(presenter.playEqualPictureSound)
    }
    
    func testCheckByNillAnswerPictureSound(){
        XCTAssertNotNil(presenter.playAnswerPictureSound)
    }
    
    func testCheckByNillFirstNumberSound(){
        XCTAssertNotNil(presenter.playFirstNumberSound)
    }
    func testCheckByNillSecondNumberSound(){
        XCTAssertNotNil(presenter.playSecondNumberSound)
    }
    
    func testCheckByNillFirstBackgroundNumberSound(){
        XCTAssertNotNil(presenter.playFirstBackgroundNumberSound)
    }
    func testCheckByNillSecondBackgroundNumberSound(){
        XCTAssertNotNil(presenter.playSecondBackgroundNumberSound)
    }
    func testCheckByNillThirdBackgroundNumberSound(){
        XCTAssertNotNil(presenter.playThirdBackgroundNumberSound)
    }
    
    func testCheckByNillFirstNumberVariantAnswerSound(){
        XCTAssertNotNil(presenter.playFirstNumberVariantAnswerSound)
    }
    func testCheckByNillSecondNumberVariantAnswerSound(){
        XCTAssertNotNil(presenter.playSecondNumberVariantAnswerSound)
    }
    func testCheckByNillThirdNumberVariantAnswerSound(){
        XCTAssertNotNil(presenter.playThirdNumberVariantAnswerSound)
    }
}
