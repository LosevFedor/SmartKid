  //
  //  ModuleBuilder.swift
  //  SmartKid
  //
  //  Created by Fedor Losev on 28/02/2020.
  //  Copyright © 2020 Fedor Losev. All rights reserved.
  //
  
  import UIKit
  
  protocol AssamblyBuilderProtocol {
    // MARK: - Creating Settings
    func createSettingsModule(_ router: RouterProtocol) -> UIViewController
    
    // MARK: - Creating Home
    func createHomeModule(_ router: RouterProtocol) -> UIViewController
    
        // MARK: - Creating All Category
        func createAllCategoryModule(_ router: RouterProtocol) -> UIViewController
    
            // MARK: - Alphabet Category
            func createABCCategoryModule(_ router: RouterProtocol) -> UIViewController
        
            // MARK: - Numbers Category
            func createNumberCategoryModule(_ router: RouterProtocol) -> UIViewController
            func createSomeNumbersModule(_ router: RouterProtocol, _ index: Int) -> UIViewController
        
            // MARK: - Read Syllables Category
            func createReadSyllablesCategoryModule(_ router: RouterProtocol) -> UIViewController
            func createReadSyllablesModule(_ router: RouterProtocol) -> UIViewController
            func createRead2SyllablesModule(_ router: RouterProtocol) -> UIViewController
            func createRead3SyllablesModule(_ router: RouterProtocol) -> UIViewController
    
            // MARK: - Adition And Subtraction Category
            func createAditionAndSubtractionModule(_ router: RouterProtocol) -> UIViewController
    
  }
  
  class AssamblyModuleBuilder: AssamblyBuilderProtocol {
    func createHomeModule(_ router: RouterProtocol) -> UIViewController {
        let homeModel = HomeModel(homeBackgroundImage: #imageLiteral(resourceName: "generalBackground"),
                                  homeBackgroundCloudsImage: #imageLiteral(resourceName: "generalBackgroundClouds"),
                                  homeAppNameImage: #imageLiteral(resourceName: "appName"),
                                  homePlayButtonImage: #imageLiteral(resourceName: "playButton"),
                                  homeSettingsButtonImage: #imageLiteral(resourceName: "settingsButton"),
                                  cloud1: #imageLiteral(resourceName: "clouds1"),
                                  cloud2: #imageLiteral(resourceName: "clouds2"),
                                  cloud3: #imageLiteral(resourceName: "clouds3"),
                                  cloud4: #imageLiteral(resourceName: "clouds4"),
                                  cloud5: #imageLiteral(resourceName: "clouds5"),
                                  cloud6: #imageLiteral(resourceName: "clouds4"))
        let homeView = HomeViewController()
        let homePresenter = HomePresenter(homeView, homeModel, router)
        homeView.homePresenter = homePresenter
        return homeView
    }
    
    func createSettingsModule(_ router: RouterProtocol) -> UIViewController {
        let settingsModel = SettingsModel(generalBackgroundImage: #imageLiteral(resourceName: "generalBackground"),
                                          generalBackgroundCloudsImage: #imageLiteral(resourceName: "settingsGeneralBackgroundClouds"),
                                          imageInscriptionsSounds: #imageLiteral(resourceName: "imageInscriptionsSounds"),
                                          imageInscriptionsContacts: #imageLiteral(resourceName: "imageInscriptionsContacts"),
                                          ARSBtnActivate: #imageLiteral(resourceName: "ARSBtnActivate"),
                                          ARSBtnNotActivate: #imageLiteral(resourceName: "ARSBtnNotActivate"),
                                          emailImage: #imageLiteral(resourceName: "sendEmailButton"),
                                          musicOnImage: #imageLiteral(resourceName: "musicOnButton"),
                                          musicOffImage: #imageLiteral(resourceName: "musicOffButton"),
                                          cloud1Image: #imageLiteral(resourceName: "settingsCloud1"),
                                          cloud2Image: #imageLiteral(resourceName: "settingsCloud2"),
                                          cloud3Image: #imageLiteral(resourceName: "settingsCloud3"),
                                          cloud4Image: #imageLiteral(resourceName: "settingsCloud4"))
        let settingsView = SettingsViewController()
        let settingsPresenter = SettingsPresenter(settingsView, settingsModel, router)
        settingsView.settingsPresenter = settingsPresenter
        return settingsView
    }
    
    func createAllCategoryModule(_ router: RouterProtocol) -> UIViewController{
        let categoryModel = AllCategoriesModel(generalBackground: #imageLiteral(resourceName: "generalBackground"),
                                               generalBackgroundCloud: #imageLiteral(resourceName: "generalBackgroundCloudsAllCategory"),
                                               syllablesBoy: #imageLiteral(resourceName: "boy"),
                                               additionAndSubtractionGirl: #imageLiteral(resourceName: "girl"),
                                               numbers: #imageLiteral(resourceName: "numbers"),
                                               alphabet: #imageLiteral(resourceName: "letters"),
                                               syllablesText: #imageLiteral(resourceName: "syllablesNameImage"),
                                               additionAndSubtractionText: #imageLiteral(resourceName: "additionAndSubtractionNameImage"),
                                               numbersText: #imageLiteral(resourceName: "numbersNameImage"),
                                               alphabetText: #imageLiteral(resourceName: "alphabetNameImage"),
                                               cloud1: #imageLiteral(resourceName: "cloud1AllCategory"),
                                               cloud2: #imageLiteral(resourceName: "cloud2AllCategory"),
                                               cloud3: #imageLiteral(resourceName: "cloud3AllCategory"),
                                               cloud4: #imageLiteral(resourceName: "cloud4AllCategory"),
                                               cloud5: #imageLiteral(resourceName: "cloud5AllCategory"),
                                               cloud6: #imageLiteral(resourceName: "cloud6AllCategory"),
                                               cloud7: #imageLiteral(resourceName: "cloud2AllCategory"))
        let categoryView = AllCategoriesViewController()
        let categoryPresenter = AllCategoriesPresenter(categoryView, categoryModel, router)
        categoryView.categoryPresenter = categoryPresenter
        return categoryView
    }
    
    func createABCCategoryModule(_ router: RouterProtocol) -> UIViewController{
        let abcCategoryModel = ABCCategoryModel(backgroundImage: #imageLiteral(resourceName: "backgroundAndClouds"))
        let abcCategoryView = ABCCategoryViewController()
        let abcCategoryPresenter = ABCCategoryPresenter(abcCategoryView, abcCategoryModel)
        abcCategoryView.abcCategoryPresenter = abcCategoryPresenter
        return abcCategoryView
    }
    
    func createNumberCategoryModule(_ router: RouterProtocol) -> UIViewController{
        let numberCategoryModel = NumbersModel(numbersBackground: #imageLiteral(resourceName: "numbersBackground"),
                                               numberArea: #imageLiteral(resourceName: "numberArea"),
                                               oneBtn: #imageLiteral(resourceName: "numberOneImage"),
                                               twoBtn: #imageLiteral(resourceName: "numberTwoImage"),
                                               threeBtn: #imageLiteral(resourceName: "numberThreeImage"),
                                               fourBtn: #imageLiteral(resourceName: "numberFourImage"),
                                               fiveBtn: #imageLiteral(resourceName: "numberFiveImage"),
                                               sixBtn: #imageLiteral(resourceName: "numberSixImage"),
                                               sevenBtn: #imageLiteral(resourceName: "numberSevenImage"),
                                               eightBtn: #imageLiteral(resourceName: "numberEightImage"),
                                               nineBtn: #imageLiteral(resourceName: "numberNineImage"),
                                               zeroBtn: #imageLiteral(resourceName: "numberZeroImage"))
        let numberCategoryView = NumbersCategoryViewController()
        let numberCategoryPresenter = NumbersCategoryPresenter(numberCategoryView, numberCategoryModel, router)
        numberCategoryView.numbersCategoryPresenter = numberCategoryPresenter
        return numberCategoryView
    }
    
    func createSomeNumbersModule(_ router: RouterProtocol, _ index: Int) -> UIViewController{

        let someNumbersModel = SomeNumbersModel(backgrounNumbersImage: #imageLiteral(resourceName: "backgroundSomeNumberModule"),
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
                                                currentIndexNumber: index)

        let someNumbersView = SomeNumbersViewController()
        let someNumbersPresenter = SomeNumbersPresenter(someNumbersView, someNumbersModel)
        someNumbersView.someNumbersPresenter = someNumbersPresenter
        return someNumbersView
    }
    
    func createReadSyllablesCategoryModule(_ router: RouterProtocol) -> UIViewController{
        let readSyllablesCategoryModel = ReadSyllableCategoryModel(generalBackgroundImage: #imageLiteral(resourceName: "readSyllableBackground"),
                                                                   sunBackgroundImage: #imageLiteral(resourceName: "readSyllableSun"),
                                                                   cloudOneBackgroundImage: #imageLiteral(resourceName:"readSyllableCloud1"),
                                                                   cloudTwoBackgroundImage: #imageLiteral(resourceName:"readSyllableCloud2"),
                                                                   syllablesImage: #imageLiteral(resourceName: "pinkBallon"),
                                                                   twoSyllablesImage: #imageLiteral(resourceName: "yellowBallon"),
                                                                   threeSyllablesImage: #imageLiteral(resourceName: "purpleBallon"))
        let readSyllablesCategoryView = ReadSyllableCategoryViewController()
        let readSyllablesCategoryPresenter = ReadSyllableCategoryPresenter(readSyllablesCategoryView, readSyllablesCategoryModel, router)
        readSyllablesCategoryView.readSyllableCategoryPresenter = readSyllablesCategoryPresenter
        return readSyllablesCategoryView
    }
    
    func createReadSyllablesModule(_ router: RouterProtocol) -> UIViewController {
        let shufledArray = getShufledArrayReadingSyllablePlist()
         
        let readSyllablesModel = ReadSyllablesModel(generalBackgroundImage: #imageLiteral(resourceName: "readSyllableBackground"),
                                                    buttonActive: #imageLiteral(resourceName: "activeBtn"),
                                                    buttonNotActive: #imageLiteral(resourceName: "notActiveBtn"),
                                                    buttonFinishActive: #imageLiteral(resourceName: "finishActiveBtn"),
                                                    shufledReadSyllablesArray: shufledArray)
        let readSyllablesView = ReadSyllablesViewController()
        let readSyllablesPresenter = ReadSyllablesPresenter(view: readSyllablesView, model: readSyllablesModel)
        readSyllablesView.readSyllablesPresenter = readSyllablesPresenter
        GameScene.gameScenePresenter = readSyllablesPresenter
        return readSyllablesView
    }
    
    func createRead2SyllablesModule(_ router: RouterProtocol) -> UIViewController {
        let shufledArray = getShufledArrayReading2SyllablePlist()
         
        let read2SyllablesModel = Read2SyllablesModel(generalBackgroundImage: #imageLiteral(resourceName: "readSyllableBackground"),
                                                      buttonActive: #imageLiteral(resourceName: "activeBtn"),
                                                      buttonNotActive: #imageLiteral(resourceName: "notActiveBtn"),
                                                      buttonFinishActive: #imageLiteral(resourceName: "finishActiveBtn"),
                                                      shufledRead2SyllablesArray: shufledArray)
        let read2SyllablesView = Read2SyllablesViewController()
        let read2SyllablesPresenter = Read2SyllablesPresenter(view: read2SyllablesView, model: read2SyllablesModel)
        read2SyllablesView.read2SyllablesPresenter = read2SyllablesPresenter
        GameScene2.gameScene2 = read2SyllablesPresenter
        return read2SyllablesView
    }
    
    func createRead3SyllablesModule(_ router: RouterProtocol) -> UIViewController {
        let shufledArray = getShufledArrayReading3SyllablePlist()
         
        let read3SyllablesModel = Read3SyllablesModel(generalBackgroundImage: #imageLiteral(resourceName: "readSyllableBackground"),
                                                      buttonActive: #imageLiteral(resourceName: "activeBtn"),
                                                      buttonNotActive: #imageLiteral(resourceName: "notActiveBtn"),
                                                      buttonFinishActive: #imageLiteral(resourceName: "finishActiveBtn"),
                                                      shufledRead3SyllablesArray: shufledArray)
        let read3SyllablesView = Read3SyllablesViewController()
        let read3SyllablesPresenter = Read3SyllablesPresenter(view: read3SyllablesView, model: read3SyllablesModel)
        read3SyllablesView.read3SyllablesPresenter = read3SyllablesPresenter
        GameScene3.gameScene3 = read3SyllablesPresenter
        return read3SyllablesView
    }
    
    func createAditionAndSubtractionModule(_ router: RouterProtocol) -> UIViewController {
        let dict = getDictionaryAditionAndSubtractionPlist()
        
        let additionAndSubtractionModel = AdditionAndSubtractionModel(dictionaryAditionAndSubtraction: dict,
                                                                    generalBackground: #imageLiteral(resourceName: "backgroundAndClouds"),
                                                                    equalImage: #imageLiteral(resourceName: "равно"),
                                                                    answerNumberImage: #imageLiteral(resourceName: "вопрос"),
                                                                    nextExampleImage: #imageLiteral(resourceName: "forward"))
        
        let additionAndSubtractionView = AdditionAndSubtractionViewController()
        let additionAndSubtractionPresenter = AdditionAndSubtractionPresenter(view: additionAndSubtractionView, model: additionAndSubtractionModel)
        additionAndSubtractionView.additionAndSubtractionPresenter = additionAndSubtractionPresenter
        
        return additionAndSubtractionView
        
    }
    
  }
