//
//  BlockchainController.swift
//  
//
//  Created by Daniel Sanabria on 14/10/21.
//

import Foundation
import Vapor

class BlockchainController {
    
    private let blockchainService: BlockchainService
    
    init() {
        self.blockchainService = BlockchainService()
    }
    
    func getBlockchain(req: Request) -> Blockchain {
        return self.blockchainService.getBlockchain()
    }
    
    func transaction(req: Request) -> EventLoopFuture<Block> {
        do {
            let transaction = try req.content.decode(Transaction.self)
            return req.eventLoop.makeSucceededFuture(self.blockchainService.getNextBlock(transactions: [transaction]))
        }
        catch(let error) {
            return req.eventLoop.makeFailedFuture(error)
        }
    }
}
