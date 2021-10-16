//
//  BlockchainController.swift
//  
//
//  Created by Daniel Sanabria on 14/10/21.
//

import Foundation
import Vapor

class BlockchainController {
    
    init() {}
    
    func greet(req: Request) -> EventLoopFuture<String> {
        return req.eventLoop.makeSucceededFuture("Welcome To Blockchain")
    }
}
