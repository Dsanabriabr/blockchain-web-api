
import Vapor

func routes(_ app: Application) throws {
    app.routes.caseInsensitive = true
    
    let blockchain = BlockchainController()
    app.get("hello", use: blockchain.greet)
}
