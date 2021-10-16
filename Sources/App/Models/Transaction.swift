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
    
    enum AdditionalInfoKeys: String, CodingKey {
            case fees
        }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
        try container.encode(amount, forKey: .amount)
        try container.encode(transactionType, forKey: .transactionType)

        var additionalContainer = encoder.container(keyedBy: AdditionalInfoKeys.self)
        try additionalContainer.encode(fees, forKey: .fees)
    }
    
    func updateAmoutFees(_ fees: Double) {
        self.fees = self.amount * fees
        self.amount -= self.fees
    }
}
