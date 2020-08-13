//
//  IAPProducts.swift
//  SmartKid
//
//  Created by Fedor Losev on 08/07/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation

enum IAPProducts: String{
    case autoRenewable = "SmartKid.autoRenewable"
}

enum IAPProductsNotificationErrors: String{
    case errorSubscriptionTransaction = "errorSubscriptionTransaction"
    case deferredSubscriptionTransaction = "deferredSubscriptionTransaction"
    case purchasingSubscriptionTransaction = "purchasingSubscriptionTransaction"
    case faildSubscriptionTransaction = "faildSubscriptionTransaction"
    case restoredSubscriptionTransaction = "restoredSubscriptionTransaction"
}
