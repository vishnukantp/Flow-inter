import FungibleToken from 0x05
import  Atoken from 0x05

transaction(receiver: Address, amount: UFix64) {

    prepare(signer: AuthAccount) {
        // Borrow the stackToken Minter reference
        let minter = signer.borrow<&Atoken.Minter>(from: /storage/MinterStorage)
            ?? panic("You are not the stackToken minter")

        // Borrow the receiver's stackToken Vault capability
        let receiverVault = getAccount(receiver)
            .getCapability<&Atoken.Vault{FungibleToken.Receiver}>(/public/Vault)
            .borrow()
            ?? panic("Error: Check your stackToken Vault status")

        // Minted tokens reference
        let mintedTokens <- minter.mintToken(amount: amount)

        // Deposit minted tokens into the receiver's stackToken Vault
        receiverVault.deposit(from: <-mintedTokens)
    }

    execute {
        log("stackToken minted and deposited successfully")
        log("Tokens minted and deposited: ".concat(amount.toString()))
    }
}