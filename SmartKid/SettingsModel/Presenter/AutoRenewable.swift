//
//  AutoRenewable.swift
//  SmartKid
//
//  Created by Fedor Losev on 11/07/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation

class AutoRenewable{
    
    static let shared = AutoRenewable()
        
    let userDefaults = UserDefaults.standard
    var showContent = false
    
    init() {}
    
    
    public func userBuyAutoRenewableSubscription() -> Bool{
        if userDefaults.object(forKey: AutoRenewableKey.autoRenewableKey.rawValue) != nil{
            return true
        }
        return false
    }
    
    public func setCurrentSubscriptionStatus(){
        let currentSubscriptionStatus = userDefaults.bool(forKey: AutoRenewableKey.autoRenewableKey.rawValue)
        showContent = currentSubscriptionStatus
    }
    
    public func buyAutoRenewablePurchase(isBoughtSubscription: Bool){
        userDefaults.set(isBoughtSubscription, forKey: AutoRenewableKey.autoRenewableKey.rawValue)
        showContent = isBoughtSubscription
    }
}
