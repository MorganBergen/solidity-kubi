// machine-readable license specifiers are important in a setting where publishing the source code is the default
// SPDX-License-Identifier:  GPL-3.0-or-later

//pragmas are instructions that are executed by the compiler before the code is compiled and executed.
//this is a preprocessor directive analogous to C++'s #include directive.
pragma solidity >=0.4.16 <0.9.0;

// a contract is a collection of functions and data, analogous to a class in C++.
contract SimpleStorage {
    // private state variables are variables that are only visible within the contract.
    uint256 storedData;

    // public method that defines set in order to modify the storedData variable.
    function set(uint256 x) public {
        storedData = x;
    }

    // public method that defines get in order to return the storedData variable.
    function get() public view returns (uint256) {
        return storedData;
    }
}

/*

This contract does not do much except store a number.
Because of the infrastructure built by Ethereum, anyone can store a single number that is accessible by anyone in the world without a (feasible) way to prevent you from publishing this number.  Anyone could call set aain with a different value adn overwrite your number, however the number is still stored in the history of the blockchain.
Later you will see how you can improse access resturctions os that only you can alter the number.

*/
