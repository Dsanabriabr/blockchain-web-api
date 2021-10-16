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
}
