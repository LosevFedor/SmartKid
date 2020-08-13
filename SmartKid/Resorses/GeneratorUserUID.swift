//
//  GeneratorUserUID.swift
//  SmartKid
//
//  Created by Fedor Losev on 08/07/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation

enum keyUUID: String{
    case kUUID = "kUUID"
}

class GeneratorUserUID{
    // MARK: - Static property
    static let shared = GeneratorUserUID()
    
    // MARK: - Private property
    private let userDefaults = UserDefaults.standard

    // MARK: - Internal func
    internal func getStatuskUUID() -> Bool{
        let uuidExist = UserDefaults.standard.object(forKey: keyUUID.kUUID.rawValue) != nil
        return uuidExist
    }
    
    internal func createUUIDIfNided(){
        let uuid = UUID().uuidString
        userDefaults.setValue(uuid, forKey: keyUUID.kUUID.rawValue)
        print(uuid)
    }
    
    internal func getUUID() -> String{
        let currentUUID = userDefaults.string(forKey: keyUUID.kUUID.rawValue)
        return currentUUID!
    }
    
}

