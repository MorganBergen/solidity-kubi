# `lecture-0`

### Introduction to solidity programming language

[**University of Kansas Blockchain Institute** ](https://kublockchain.com)

Morgan Bergen, B.S. Computer Science - Director of Education

By the end of this lecture you will be able to build and deploy your first `HelloWorld.sol` program.

```
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld
{

    string private stateVariable = "Hello World";

    function GetHelloWorld() public view returns ( string memory)
    {
        return stateVariable;
    }

}
```

#### I. Technical Requirements

This is a programming lecture series, thus most of the work and teaching here will consist of programming and implementing programs on the Ethereum Virtual Machine. Execute the instructions, given in this lecture, will focus on deployment on a macOS machine, however you can use a machine with any operating system (Windows, Linux).

Ethereum-based blockchain programs can be deployed to multiple public networks, test networks, or private networks. The following will be the Ethereum-based tools and utilities that are necessary for building our programs. The following are the required assets you need to set up your development enviroment for building testing, deploying, & interacting with solidity contracts

**What you will need for this lecture series**:

1.  [Solidity Programming Essentials by Ritesh Modi ](libgen.li/file.php?md5=edd48931e28e22d74c84a03c28f50118)

2.  [Git Code Repository](https://github.com/PacktPublishing/Solidity-Programming-Essentials-Second-Edition.git)

3.  [Solidity compiler 0.18.13](https://github.com/PacktPublishing/Solidity-Programming-Essentials-Second-Edition.git)

4.  [web3.js v1.5.3](https://web3js.readthedocs.io/en/v1.7.5/) is a collection of libraries that allow you to interact with a local or remote ethereum node using HTTP, IPC or WebSocket.

5.  [node.js](https://nodejs.org/en/) is an open-source, cross-platform, JavaScript runtime environment.
    CLI install method with homebrew `$ brew install node`

6.  [Ganache v7.0.3](https://github.com/trufflesuite/ganache.git) is a Personal blockchain for Ethereum development CLI install method with homebrew `$ brew install --cask ganache`

#### II. Overview of Solidity

Solidity is an object-oriented contract-oriented language designed to compile code for the Ethereum Virtual Machine.

#### III. Installing Ethereum & Solidity

The important utilities related to the Ethereum ecosystem will be provided along with Geth, which is one of the main Ethereum implementations.

#### IV. `Hello World`
