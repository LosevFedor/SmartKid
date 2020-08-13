//
//  RouterTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 12/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class MockNavigationController: UINavigationController{
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    
    let assambly = AssamblyModuleBuilder()
    let mockNumber = 1
    
    override func setUp() {
       router = Router(navigationController: navigationController, assamblyBuilder: assambly)
    }

    override func tearDown() {
        router = nil
    }
    
    
    func testRouterShowSettingsModule(){
        router.showSettingsModule()
        let settingsViewController = navigationController.presentedVC
       XCTAssert(settingsViewController is SettingsViewController)
    }
    
    func testRouterShowAllCategoriesModule(){
        router.showAllCategoriesModule()
        let allCategoriesViewController = navigationController.presentedVC
        XCTAssert(allCategoriesViewController is AllCategoriesViewController)
    }
    
    func testRouterShowAlphabetCategoryModule(){
        router.showABCCategoryModule()
        let alphabetCategoryViewController = navigationController.presentedVC
        XCTAssert(alphabetCategoryViewController is ABCCategoryViewController)
    }
    
    func testRouterShowNumbersCategoryModule(){
        router.showNumbersCategoryModule()
        let numbersCategoryViewController = navigationController.presentedVC
        XCTAssert(numbersCategoryViewController is NumbersCategoryViewController)
    }
    
    func testRouterShowSomeNumber(){
        router.showSomeNumber(mockNumber)
        let showSomeNumber = navigationController.presentedVC
        XCTAssert(showSomeNumber is SomeNumbersViewController)
    }
    
    func testRouterShowReadSyllableCategoryModule(){
        router.showReadSyllablesCategoryModule()
        let showSomeNumber = navigationController.presentedVC
        XCTAssert(showSomeNumber is ReadSyllableCategoryViewController)
    }
    
    func testRouterShowshowReadSyllablesModule(){
        router.showReadSyllables()
        let showSomeNumber = navigationController.presentedVC
        XCTAssert(showSomeNumber is ReadSyllablesViewController)
    }
    
}
