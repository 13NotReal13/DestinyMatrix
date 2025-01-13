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
    
    func fetchProducts() {
        let productIdentifiers: Set<String> = ["matrix.destiny.calculation"]
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        
        print("Продукты получены: \(products.map { $0.localizedTitle })")
    }
    
    func purchase(productID: String) {
        guard let product = products.first(where: { $0.productIdentifier == productID }) else {
            print("Продукт с ID \(productID) не найден")
            return
        }
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                print("Покупка успешна!")
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                print("Ошибка покупки: \(transaction.error?.localizedDescription ?? "Неизвестная ошибка")")
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
    
    func startObserving() {
        SKPaymentQueue.default().add(self)
    }
    
    func stopObserving() {
        SKPaymentQueue.default().remove(self)
    }
}
