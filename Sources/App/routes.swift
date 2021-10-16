
import Vapor

func routes(_ app: Application) throws {
    app.routes.caseInsensitive = true
    
    let blockchain = BlockchainController()
    let blockchainApp = app.grouped("blockchain")
    blockchainApp.get("", use: blockchain.getBlockchain)
    blockchainApp.post("transaction", use: blockchain.transaction)
}
