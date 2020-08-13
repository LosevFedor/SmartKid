//
//  Router.swift
//  SmartKid
//
//  Created by Fedor Losev on 29/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import UIKit

protocol RouterMainProtocol{
    var navigationController: UINavigationController? {get set}
    var assamblyBuilder: AssamblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMainProtocol{
    func initialViewController()
    
    func showSettingsModule()
    func showAllCategoriesModule()
    func showABCCategoryModule()
    func showNumbersCategoryModule()
    func showSomeNumber(_ index: Int)
    func showReadSyllablesCategoryModule()
    func showReadSyllables()
    func showRead2Syllables()
    func showRead3Syllables()
    func showAdditionAndSubtractionCategoryModule()
    
}

class Router: RouterProtocol{
    var navigationController: UINavigationController?
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assamblyBuilder: AssamblyBuilderProtocol){
        self.navigationController = navigationController
        self.assamblyBuilder = assamblyBuilder
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x277E87, a: 0.5)
    }
    
    func initialViewController() {
        if let navigationController = navigationController{
            guard let homeViewController = assamblyBuilder?.createHomeModule(self) else { return }
            navigationController.viewControllers = [homeViewController]
        }
    }
    
    func showSettingsModule(){
        if let navigationController = navigationController{
            guard let settingsViewController = assamblyBuilder?.createSettingsModule(self) else { return }
            navigationController.pushViewController(settingsViewController, animated: true)
        }
    }
    
    func showAllCategoriesModule() {
        if let navigationController = navigationController{
            guard let categoriesViewController = assamblyBuilder?.createAllCategoryModule(self) else { return }
            navigationController.pushViewController(categoriesViewController, animated: true)
        }
    }
    
    func showABCCategoryModule(){
        if let navigationController = navigationController{
            guard let abcCategoryViewController = assamblyBuilder?.createABCCategoryModule(self) else { return }
            navigationController.pushViewController(abcCategoryViewController, animated: true)
        }
    }
    
    func showNumbersCategoryModule(){
        if let navigationController = navigationController{
            guard let numbersCategoryViewController = assamblyBuilder?.createNumberCategoryModule(self) else { return }
            navigationController.pushViewController(numbersCategoryViewController, animated: true)
        }
    }
    
    func showSomeNumber(_ index: Int){
        if let navigationController = navigationController{
            guard let someNumbersViewController = assamblyBuilder?.createSomeNumbersModule(self, index) else { return }
            navigationController.pushViewController(someNumbersViewController, animated: true)
        }
    }
    
    func showReadSyllablesCategoryModule(){
        if let navigationController = navigationController{
            guard let readSyllablesCategoryViewController = assamblyBuilder?.createReadSyllablesCategoryModule(self) else { return }
            navigationController.pushViewController(readSyllablesCategoryViewController, animated: true)
        }
    }
    
    func showReadSyllables(){
        if let navigationController = navigationController{
            guard let readSyllablesViewController = assamblyBuilder?.createReadSyllablesModule(self) else { return }
            navigationController.pushViewController(readSyllablesViewController, animated: true)
        }
    }
    
    func showRead2Syllables(){
        if let navigationController = navigationController{
            guard let read2SyllablesViewController = assamblyBuilder?.createRead2SyllablesModule(self) else { return }
            navigationController.pushViewController(read2SyllablesViewController, animated: true)
        }
    }
    
    func showRead3Syllables(){
        if let navigationController = navigationController{
            guard let read3SyllablesViewController = assamblyBuilder?.createRead3SyllablesModule(self) else { return }
            navigationController.pushViewController(read3SyllablesViewController, animated: true)
        }
    }
    
    func showAdditionAndSubtractionCategoryModule(){
        if let navigationController = navigationController{
            guard let aditionAndSubtractionCategoryViewController = assamblyBuilder?.createAditionAndSubtractionModule(self) else { return }
            navigationController.pushViewController(aditionAndSubtractionCategoryViewController, animated: true)
        }
    }  
}


