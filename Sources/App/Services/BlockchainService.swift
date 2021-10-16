//
//  BlockchainService.swift
//  
//
//  Created by Daniel Sanabria on 15/10/21.
//

import Foundation

class BlockchainService {
    
    private let blockchain: Blockchain
    
    init() {
        self.blockchain = Blockchain(genisBlock: Block())
    }
    
    func getBlockchain() -> Blockchain {
        return self.blockchain
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transactions: transactions)
        self.blockchain.addBlock(block)
        return block
    }
}
