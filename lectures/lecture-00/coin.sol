/*
The following contract implements the most primitive form of a cryptocurrency.
The contract allows only its reactor to create new coins.
Anyone can send coins to each other without a need to registering with a username and password, 
all you need is an Ethereum keypair.
*/

// SPDX-License-Identifier:  GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    // keyword public declares minter as a public member state/variable which can be viewed by anyone.
    // accessible from other contracts
    address public minter;

    mapping(address => uint256) public balances;

    // Events allow clients to react to specific contract changes you declare
    event Sent(address from, address to, uint256 amount);

    // Coin becomes constructed when the contract is deployed, no parameters are required.
    // minter is set to the address of the contract itself.
    constructor() {
        minter = msg.sender;
    }

    // sends an amount of newly created coins to an address, but can only be called by the contract creator.
    function mint(address receiver, uint256 amount) public {
        // asserting that an amount of newly created coins to an address
        require(msg.sender == minter);

        // increment the balance of the receiver by the amount of coins
        balances[receiver] += amount;
    }

    // Errors allow you to provide informtion about why an operation failed.
    error InsufficientBalance(uint256 request, uint256 available);

    // sends an amount of existing coins from any caller to an address.
    function send(address reciever, uint256 amount) public {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance({
                request: amount,
                available: balances[msg.sender]
            });
        }
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender, reciever, amount);
    }
}
