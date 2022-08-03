# `lecture-0`

Introduction to solidity programming language

Morgan Bergen, B.S. Computer Science - Director of Education [University of Kansas Blockchain Institute](https://kublockchain.com)

## Learning Objective

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

##### Ethereum networks

Ethereum is an open source platform for building and deploying dApps (distrubuted/decentralized applications). Ethereum is a P2P (peer-to-peer) network of computers (also known as nodes) all interconnected and used to store data in the distributed data structure (commonly refered to as a ledger). This means that a copy of the ledger is available to each node on the network. There are different types of networks that developers can utilize in order to deploy their dApps. (We will be building our programs on networks that will not actually cost any ether or money.) The three different

**Types of Ethereum Networks:**

1.  Permissioned
2.  Private
3.  Public

**Main Network**

The main Ethereum network is a global public network that anyone can use. It can be accessed using an account, and anyone can deploy their solutions and smart contacts. Deploying and using this main network incurs a cost in terms of gas. The main netwrok is a public chain that is accesible over the internet and anyone can connect to it and acces both data and transactions stored in it.

**Testnets**

Testnets (known as Test networks) are intended to help with oboarding adoption of Ethereum blockchains and testing facilities on this chain. This network has a different ledger and storage than the main network and us completely free of cost. This is because test ethers can be generated using faucets and used on these networks. There are multiple different test networks,

[**1. Ropsten**](https://ropsten.etherscan.io)

Originally named **Morden** this is the the most widely used test networks that uses PoW (Proof of Work) consensus methods for generating blocks. This network can be used with the `--testnet` option available in Geth. (more on using this network in the following sections)

[**2. Rinkeby**](https://www.rinkeby.io/#stats)

Another Ethereum-based test network that uses PoA (Proof of Authority) consensus methods.

[**3. Kovan Testnet**](https://kovan-testnet.github.io/website/)

Kovan test networks can only be used by parity clients and hence won't be discussed or used in this book.
Kovan another PoA (Proof of Authority) publicly accessible network; created and maintained by a consortium of Ethereum developers, this network can only be used by parity clients and therefore will not be utilized or discussed later on.

[**4. Goerli**](https://goerli.net)

Goerli is the last PoA consensus method based test network, this too is a cross client network and will not be utilized or discussed later on.

**Private Network**

A private network is created and hosted on private infrastructure. Private networks are controlled by a single organization, and it has full control over it. There are solutions, contracts, and use cases that an organization might not want to put on a public network, even for test purposes. They may want to use private chains for development, testing, and production environments. Organizations should create and host a private network, and they will have full control over it. Further in this chapter, we will see how to create your own private network.

**Consortium Network**

Lastly a consortium network is a private network but the network comprises of onodes that are managed by different organizations. No organization has total control over the data and chain, however it is shared within an organization and everyone can view and modify it's current state. These networks are accessible through the internet or completely private networks requiring VPNs (Virtual private networks).

### Installing and Configuring Geth

Implementation of Ethereum nodes and clients is available in multiple languages, including Go, C++, Python, JavaScript, Java, and Ruby. The functionality or usability of these clients is the same across languages, and developers should choose the language implementation they are most comfortable with.

Geth is the Go implementation which acts as an Ethereum client to connect to public and test networks, but also used to create the mining and EVM (transaction nodes) for private networks. Geth is a CLI tool written in Go and used for creating a node and miners on a private chain. This lecture will provide how to install Geth on macOS.

<!-- <img src="https://github.com/MorganBergen/learn-solidity-kubi/blob/main/lectures/assets/brew-install.png"> -->

<!-- <img align="left" width=10% src="/lectures/assets/KU-Blockchain-logo.svg"> -->

<img src="/MorganBergen/learn-solidity-kubi/blob/main/lectures/assets/brew-install.png">

#### IV. `Hello World`

- Ethereum network
- Intsalling and Configuring Geth
- Creating a private network
- Intsalling ganache-cli
- Installing the solidity compiler
- Installing the web3 framework
- Installing and working with MetaMask
