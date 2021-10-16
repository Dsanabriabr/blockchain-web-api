//
//  Transaction.swift
//  
//
//  Created by Daniel Sanabria on 15/10/21.
//

import Foundation
import Vapor

enum TransactionType: String, Content {
    case domestic
    case international
}

final class Transaction: Content {
    
    private let from: String
    private let to: String
    private(set) var amount: Double
    private(set) var fees: Double = 0.0
    public let transactionType: TransactionType
    
    init(from: String, to: String, amount: Double, transactionType: TransactionType) {
        self.from = from
        self.to = to
        self.amount = amount
        self.transactionType = transactionType
    }
    
    private enum CodingKeys: CodingKey {
        case from, to, amount, transactionType
    }
}
