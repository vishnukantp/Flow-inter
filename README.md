# Customizable Fungible Token
This project involves the creation of a unique token with the capability to swap.

## Overview
We've developed a unique token named "Atoken" and incorporated the $Flow token. An account holder of either token can exchange it for the other at the currently established rate.

## How to Begin
### Installation
Simply download the project and transfer it to the Flow playground for execution.

### Running the Program
To execute the smart contract and scripts, visit the Flow playground website.

### Core Contract Implementation

**Contract - FlowToken:**
- Implements an owner-controlled minting process.
- Utilizes a Vault resource for maintaining token balances.
- Features an array of transactions and scripts for robust token management.

**Code Insights:**
- Emphasizes the deposit function within the Vault resource for secure token transfer and prevention of double-counting.

### Fundamental Transactions and Scripts

**Transactions:**
- **MINT:** Facilitates token minting to designated recipients.
- **SETUP:** Streamlines the initialization of a user's vault in account storage.
- **TRANSFER:** Enables users to transfer tokens to different addresses.

**Scripts:**
- **READ BALANCE:** Retrieves the token balance in a user’s vault.
- **SETUP VALIDATION:** Confirms correct vault setup.
- **TOTAL SUPPLY CHECK:** Reports the total circulating supply of tokens.

### Transaction and Script Enhancements

- Improving SETUP transaction to remedy improperly set up vaults.
- Enhancing READ BALANCE script for compatibility with non-standard vault setups.

**Key Features:**
- Resource identifiers for verifying token types.
- Resource capabilities for vault authenticity validation.

### Contract and Transaction Augmentation

**Admin Capabilities:**
- Empowers the Admin to withdraw tokens from user vaults and deposit equivalent $FLOW tokens.
- **New Transaction:** Admin Withdraw and Deposit: Admin-exclusive transaction for token management.

### Advanced Scripting

**Scripts:**
- **BALANCE SUMMARY:** Presents a summary of a user’s $FLOW and custom token vault balances.
- **VAULT OVERVIEW:** Provides a detailed overview of all recognized Fungible Token vaults in a user’s storage.

### Swap Contract Integration

**Swap Contract:**
- Facilitates users to exchange $FLOW tokens for custom tokens based on the duration since their last exchange.

**Swap Mechanics:**
- Utilizes a custom identity resource and the user's $FLOW vault reference to authenticate user identity and facilitate secure token swaps.

## Project Conclusion

This repository exemplifies a comprehensive Fungible Token contract deployment on the Flow blockchain. It systematically presents functionalities, including token minting, vault setup, token transfer, and token swapping, ensuring enhanced comprehensibility and ease of navigation.



