<img align="left" width=10% src="/assets/KU-Blockchain-logo.svg">

# `learn solidity with KUBI`
![maintenance-status](https://img.shields.io/badge/maintenance-experimental-blue.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-passively--maintained-yellowgreen.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-looking--for--maintainer-orange.svg)

## Introduction to solidity programming language

[ **University of Kansas Blockchain Institute** ](https://kublockchain.com)

Morgan Bergen, B.S. Computer Science - Director of Education

A ten part lecture series on the introduction to Blockchain, Ethereum, and Smart Contracts. This repo will take you through how to deploy an application on an ethereum blockchain network, understand the languages terminology and jargon, advantages, problems it’s trying to solve, and industry relevance. This lecture series will explain the important concepts of solidity and it's architecture in detail.

Details regarding solidity concepts like externally owned accounts, contract accounts, its currency in terms of gas and Ether will be discussed. Ethereum is heavily based on cryptography and you’ll also learn about hash, encryption, and usage of keys for creating transactions and accounts. How are transactions and accounts created, how gas is paid for each transaction, difference between message calls and transactions, and storage of code and state management will be explained in detailed.  All information within this repo has been allocated from the follow two sources.

[solidity documentation](https://docs.soliditylang.org/_/downloads/en/latest/pdf/)
[geth documentation](https://github.com/ethereum/go-ethereum)

## directory tree

```
.
└── lectures
│   │
│   ├── lecture-00
│   │   └── README.md               # intro to primitive smart contract, enviroment configuration
│   │       │
│   │       ├── brew-install.png    # homebrew install preview of installing ethereum and geth
│   │       ├── geth-help.txt       # console output preview of geth help command
│   │       ├── geth--mainnet.txt   # console output preview of geth mainnet command
│   │       └── geth--mainnet.png   # image console ouput of geth mainnet command
│   │
│   └── lecture-01
│       └── README.md               # private network set up
│       ├── example.json            # manual set up of configs - gaslimit, chainid : 12345
│       ├── figures                 # terminal output png
│       └── genesis                 # experimental genesis nodes
│
├── network
│   └── figures
│       │
│       ├── figure-0.0.png
│       ├── figure-0.1.png
│       ├── figure-0.2.png
│       ├── figure-0.3.png
│       ├── figure-0.4.png
│       └── figure-0.5.png
│
└── ...
```
