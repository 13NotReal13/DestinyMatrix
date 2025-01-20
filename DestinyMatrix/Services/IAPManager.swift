//
//  IAPManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 13/01/2025.
//

import Foundation
import StoreKit

final class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    static let shared = IAPManager()
    private var products: [SKProduct] = []
    
    var onPurchaseSuccess: (() -> Void)?
    var onPurchaseFailure: ((Error?) -> Void)?

    func fetchProducts() {
        let productIdentifiers: Set<String> = ["matrix.destiny.calculation"]
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }
    
    func getProducts() -> [SKProduct] {
        return products
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
    }
    
    func purchase(productID: String, success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        guard let product = products.first(where: { $0.productIdentifier == productID }) else { return }
        
        FirebaseLogManager.shared.logPurchaseStart(productID: productID)
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        
        self.onPurchaseSuccess = {
            FirebaseLogManager.shared.logPurchaseSuccess(productID: productID, price: product.localizedPrice ?? "N/A") // Лог успешной покупки
            success()
        }
        
        self.onPurchaseFailure = { error in
            FirebaseLogManager.shared.logPurchaseFailure(productID: productID, error: error?.localizedDescription) // Лог ошибки покупки
            failure(error)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                onPurchaseSuccess?()
            case .failed:
                let errorMessage = transaction.error?.localizedDescription ?? "Transaction was cancelled by user"
                FirebaseLogManager.shared.logPurchaseFailure(productID: transaction.payment.productIdentifier, error: errorMessage)
                SKPaymentQueue.default().finishTransaction(transaction)
                onPurchaseFailure?(transaction.error)
            default:
                break
            }
        }
    }
    
    func restorePurchases() {
        if #available(iOS 15.0, *) {
            Task {
                do {
                    try await AppStore.sync()
                    FirebaseLogManager.shared.logRestoreSuccess() // Лог успешного восстановления
                } catch {
                    FirebaseLogManager.shared.logRestoreFailure(error: error.localizedDescription) // Лог ошибки восстановления
                }
            }
        } else {
            SKPaymentQueue.default().restoreCompletedTransactions()
        }
    }
    
    func startObserving() {
        SKPaymentQueue.default().add(self)
    }
    
    func stopObserving() {
        SKPaymentQueue.default().remove(self)
    }
}

extension SKProduct {
    var localizedPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)
    }
}
