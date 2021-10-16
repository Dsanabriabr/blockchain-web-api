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
    
    init(genisBlock: Block) {
        addBlock(genisBlock)
    }
    
    private enum CodingKeys: CodingKey {
        case blocks
    }
    
    func addBlock(_ block: Block) {
        if self.blocks.isEmpty {
            block.previousHash = "000000000000000"
            block.hash = generateHash(for: block)
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
}
