//
//  IAPManager.swift
//  SmartKid
//
//  Created by Fedor Losev on 08/07/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation
import StoreKit

class IAPManager: NSObject{
    static let shared = IAPManager()
    
    var products: [SKProduct] = []
    let paymentQueue = SKPaymentQueue.default()
    
    private let userDefaults = UserDefaults.standard
    
    func setupPurchases(completion: @escaping(Bool)->()){
        if SKPaymentQueue.canMakePayments(){
            paymentQueue.add(self)
            completion(true)
            return
        }
        completion(false)
    }
    
    public func getProducts(){
        let identifire: Set = [IAPProducts.autoRenewable.rawValue]
        
        let productRequest = SKProductsRequest(productIdentifiers: identifire)
        productRequest.delegate = self
        productRequest.start()
    }
    
    public func purchaseProduct(){
        guard let purchaseProduct = products.first else { return }
        let payment = SKPayment(product: purchaseProduct)
        paymentQueue.add(payment)
    }
    
//    public func restoreCompletedTransactions(){
//        paymentQueue.restoreCompletedTransactions()
//    }
}

// MARK: extension SKPaymentTransactionObserver
extension IAPManager: SKPaymentTransactionObserver{
    // MARK: Internal func
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            switch transaction.transactionState {
            case .deferred:
                NotificationCenter.default.post(name: Notification.Name(IAPProductsNotificationErrors.deferredSubscriptionTransaction.rawValue), object: nil)
                break
            case .purchasing:
                NotificationCenter.default.post(name: Notification.Name(IAPProductsNotificationErrors.purchasingSubscriptionTransaction.rawValue), object: nil)
                break
            case .failed: faild(transaction: transaction)
            case .purchased: completed(transaction: transaction)
            case .restored: restored(transaction: transaction)
            @unknown default:
                print("default")
            }
        }
    }
    
    func checkCancellationDate(){
        let receiptValidator = ReceiptValidator()
        let result = receiptValidator.validateReceipt()
        switch result {
        case let .success(receipt):
            guard let purchase = receipt.inAppPurchaseReceipts?.filter({ $0.productIdentifier == IAPProducts.autoRenewable.rawValue }).first else { return }
            if let cancellationDate = purchase.cancellationDate{
                guard let expirationDate = purchase.subscriptionExpirationDate else { return }
                provideContentBeforeSubscriptionExpires(cancellDate: cancellationDate, expirationDate: expirationDate)
            }
            return
        case let .error(error):
            print(error.localizedDescription)
        }
        
    }
    
    // MARK: - Private func
    private func provideContentBeforeSubscriptionExpires(cancellDate: Date, expirationDate: Date){
        let currentDate = getFormatterDate()
        let expirationDate = expirationDate
        if currentDate >= expirationDate{
            userDefaults.set(false, forKey: AutoRenewableKey.autoRenewableKey.rawValue)
        }
        
    }
    
    private func faild(transaction: SKPaymentTransaction){
        if let transactionError = transaction.error as NSError?{
            if transactionError.code != SKError.paymentCancelled.rawValue{
                print("error transaction: \(transaction.error!.localizedDescription)")
            }
        }
        NotificationCenter.default.post(name: Notification.Name(IAPProductsNotificationErrors.faildSubscriptionTransaction.rawValue), object: nil)
        paymentQueue.finishTransaction(transaction)
    }
    
    private func completed(transaction: SKPaymentTransaction){
        let receiptValidator = ReceiptValidator()
        let result = receiptValidator.validateReceipt()
        
        switch result {
        case let .success(receipt):
            guard let purchase = receipt.inAppPurchaseReceipts?.filter({ $0.productIdentifier == IAPProducts.autoRenewable.rawValue }).first else { return }
            if purchase.subscriptionExpirationDate?.compare(Date()) == .orderedDescending{
                AutoRenewable.shared.buyAutoRenewablePurchase(isBoughtSubscription: true)
            }else{
                AutoRenewable.shared.buyAutoRenewablePurchase(isBoughtSubscription: false)
            }
            NotificationCenter.default.post(name: Notification.Name(transaction.payment.productIdentifier), object: nil)
        case let .error(error):
            NotificationCenter.default.post(name: Notification.Name(IAPProductsNotificationErrors.errorSubscriptionTransaction.rawValue), object: nil)
            print(error.localizedDescription)
        }
        paymentQueue.finishTransaction(transaction)
    }
    
    private func restored(transaction: SKPaymentTransaction){
        NotificationCenter.default.post(name: Notification.Name(IAPProductsNotificationErrors.restoredSubscriptionTransaction.rawValue), object: nil)
        paymentQueue.finishTransaction(transaction)
        
    }
    
}

// MARK: extension SKProductsRequestDelegate
extension IAPManager: SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        
    }
}
