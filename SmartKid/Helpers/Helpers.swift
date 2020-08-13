//
//  Helpers.swift
//  SmartKid
//
//  Created by Fedor Losev on 22/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

public func logAvailableFont(){
    for family: String in UIFont.familyNames{
        print("\(family)")
        for names:String in UIFont.fontNames(forFamilyName: family){
            print("==\(names)")
        }
    }
}

public func debugDrawPlayableArea(){
    let shape = SKShapeNode()
    let path = CGMutablePath()
    // path.addRect(<#playableRect#>)
    shape.path = path
    shape.strokeColor = SKColor.red
    shape.lineWidth = 4.0
    // <#addChild(shape)#>
    
}

public func backToAllCategories(navController: UINavigationController){
    for controller in navController.viewControllers as Array {
        if controller.isKind(of: AllCategoriesViewController.self) {
            navController.popToViewController(controller, animated: true)
            break
        }
    }
}

public func getShufledArrayReadingSyllablePlist() -> Array<(key: Any, value: Any)>{
    var nsDictionary: NSDictionary?
    if let path = Bundle.main.path(forResource: RS_PLIST, ofType: PLIST) {
        nsDictionary = NSDictionary(contentsOfFile: path)
    }
    let shufledArray = nsDictionary?.shuffled()
    
    return shufledArray!
}

public func getShufledArrayReading2SyllablePlist() -> Array<(key: Any, value: Any)>{
    var nsDictionary: NSDictionary?
    if let path = Bundle.main.path(forResource: R2S_PLIST, ofType: PLIST) {
        nsDictionary = NSDictionary(contentsOfFile: path)
    }
    let shufledArray = nsDictionary?.shuffled()
    
    return shufledArray!
}

public func getShufledArrayReading3SyllablePlist() -> Array<(key: Any, value: Any)>{
    var nsDictionary: NSDictionary?
    if let path = Bundle.main.path(forResource: R3S_PLIST, ofType: PLIST) {
        nsDictionary = NSDictionary(contentsOfFile: path)
    }
    let shufledArray = nsDictionary?.shuffled()
    
    return shufledArray!
}

public func getDictionaryAditionAndSubtractionPlist() -> NSDictionary{
    var nsDictionary: NSDictionary?
    if let path = Bundle.main.path(forResource: AS_PLIST, ofType: PLIST){
        nsDictionary = NSDictionary(contentsOfFile: path)
    }
    return nsDictionary!
}

public func randomFakeSyllable() -> String {
    let lenghtString = Int.random(in: 1 ... 2)
    let letters = RUS_ALPHABET
    return String((0..<lenghtString).map{ _ in letters.randomElement()! })
}

public func getFormatterDate() -> Date{
    let now = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    let currentFormatterStringDate = dateFormatter.string(from: now)
    let currentFormatterDate = dateFormatter.date(from: currentFormatterStringDate)
    
    return currentFormatterDate!
}
