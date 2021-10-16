//
//  SmartContract.swift
//  
//
//  Created by Daniel Sanabria on 15/10/21.
//

import Foundation

protocol SmartContract {
    func apply(transaction: Transaction)
}

class TransactionTypeSmartContract: SmartContract {
    
    func apply(transaction: Transaction) {
        var fees = 0.0
        switch transaction.transactionType {
        case .domestic:
            fees = 0.02
        case .international:
            fees = 0.05
        }
        transaction.updateAmoutFees(fees)
    }
}
