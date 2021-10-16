//
//  Block.swift
//  
//
//  Created by Daniel Sanabria on 15/10/21.
//

import Foundation
import Vapor

final class Block: Content {
    
    public var nonce: Int
    public var index: Int = 0
    public var previousHash: String = ""
    public var hash: String!
    public var key: String {
        get {
            return getKey()
        }
    }
    public var transactions: [Transaction] = []
    
    init() {
        self.nonce = 0
    }
    
    func addTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }
    
    private func getKey() -> String {
        let transactionData = try! JSONEncoder().encode(self.transactions)
        let transactionJSONString = String(data: transactionData, encoding: .utf8) ?? ""
        return String(self.index) + self.previousHash + String(self.nonce) + transactionJSONString
    }
}
