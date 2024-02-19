import FungibleToken from 0x05
import Atoken from 0x05

pub fun main(account: Address) {

    // Attempt to borrow PublicVault capability
    let publicVault: &Atoken.Vault{FungibleToken.Balance, FungibleToken.Receiver, Atoken.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&Atoken.Vault{FungibleToken.Balance, FungibleToken.Receiver, Atoken.CollectionPublic}>()

    if (publicVault == nil) {
        // Create and link an empty vault if capability is not present
        let newVault <- Atoken.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&Atoken.Vault{FungibleToken.Balance, FungibleToken.Receiver, Atoken.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        
        // Borrow the vault capability again to display its balance
        let retrievedVault: &Atoken.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&Atoken.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        // Borrow the vault capability for further checks
        let checkVault: &Atoken.Vault{FungibleToken.Balance, FungibleToken.Receiver, Atoken.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&Atoken.Vault{FungibleToken.Balance, FungibleToken.Receiver, Atoken.CollectionPublic}>()
                ?? panic("Vault capability not found")
        
        // Check if the vault's UUID is in the list of vaults
        if Atoken.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a Atoken vault")
        } else {
            log("This is not a Atoken vault")
        }
    }
}