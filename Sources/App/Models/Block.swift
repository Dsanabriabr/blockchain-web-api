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
    
    init() {
        self.nonce = 0
    }
    
    private func getKey() -> String {
        return String(self.index) + self.previousHash + String(self.nonce)
    }
}
