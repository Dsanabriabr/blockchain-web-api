//
//  Blockchain.swift
//  
//
//  Created by Daniel Sanabria on 15/10/21.
//

import Foundation
import Vapor

final class Blockchain: Content {
    
    private (set) var blocks: [Block] = []
    private (set) var smartContracts: [SmartContract] = []
    
    init(genisBlock: Block) {
        addBlock(genisBlock)
        addSmartContracts()
    }
    
    private enum CodingKeys: CodingKey {
        case blocks
    }
    
    func addSmartContracts() {
        smartContracts.append(TransactionTypeSmartContract())
    }
    
    func addBlock(_ block: Block) {
        if self.blocks.isEmpty {
            block.previousHash = "000000000000000"
            block.hash = generateHash(for: block)
        }
        
        self.smartContracts.forEach { contract in
            block.transactions.forEach { transaction in
                contract.apply(transaction: transaction)
            }
        }
        
        self.blocks.append(block)
    }
    
    func generateHash(for block: Block) -> String {
        var hash = block.key.sha1Hash()
        
        while(!hash.hasPrefix("00")) {
            block.nonce += 1
            hash = block.key.sha1Hash()
        }
        
        return hash
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = Block()
        transactions.forEach { transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = self.blocks.count
        block.previousHash = previousBlock.hash
        block.hash = generateHash(for: block)
        return block
    }
    
    func getPreviousBlock() -> Block {
        return self.blocks[self.blocks.count - 1]
    }
}
