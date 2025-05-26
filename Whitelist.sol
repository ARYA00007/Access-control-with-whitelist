// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhitelistAccessControl {
    address public owner;

    // Mapping to keep track of whitelisted addresses
    mapping(address => bool) public whitelisted;

    // Events
    event AddedToWhitelist(address indexed account);
    event RemovedFromWhitelist(address indexed account);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Modifier to restrict function to only owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Modifier to restrict function to only whitelisted addresses
    modifier onlyWhitelisted() {
        require(whitelisted[msg.sender], "Not whitelisted");
        _;
    }

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), owner);
    }

    // Owner can add an address to the whitelist
    function addToWhitelist(address _address) external onlyOwner {
        whitelisted[_address] = true;
        emit AddedToWhitelist(_address);
    }

    // Owner can remove an address from the whitelist
    function removeFromWhitelist(address _address) external onlyOwner {
        whitelisted[_address] = false;
        emit RemovedFromWhitelist(_address);
    }

    // Owner can transfer ownership
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // A function only accessible to whitelisted addresses
    function restrictedAction() external onlyWhitelisted {
        // Example action: could be minting tokens, accessing sensitive data, etc.
    }
}
