import FungibleToken from 0x05
import Atoken from 0x05

pub fun main(account: Address) {

    // Borrow the public vault capability and handle errors
    let publicVault = getAccount(account)
        .getCapability(/public/Vault)
        .borrow<&Atoken.Vault{FungibleToken.Balance}>()
        ?? panic("Vault not found, setup might be incomplete")

    log("Vault setup verified successfully")
}