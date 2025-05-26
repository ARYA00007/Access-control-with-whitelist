# Access Control with Whitelist – Solidity Smart Contract

This Solidity smart contract implements a simple access control mechanism using a whitelist. Only whitelisted addresses are allowed to perform certain restricted actions. It is useful for scenarios like token sales, admin-restricted features, gated content, and more.

## 🛠 Features

- ✅ Owner-only whitelist management
- ✅ Restricts function access to approved (whitelisted) addresses
- ✅ Ownership transfer capability
- ✅ Event logging for transparency

## 📄 Contract Overview

### Constructor
Initializes the contract and sets the deployer as the owner.

```solidity
constructor()
# Access-control-with-whitelist
