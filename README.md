<img align="left" width=10% src="/assets/KU-Blockchain-logo.svg">

# `learn solidity with KUBI`
![maintenance-status](https://img.shields.io/badge/maintenance-experimental-blue.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-passively--maintained-yellowgreen.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-looking--for--maintainer-orange.svg)

## Introduction to solidity programming language

[ **University of Kansas Blockchain Institute** ](https://kublockchain.com)

Morgan Bergen, B.S. Computer Science - Director of Education

A multi part lecture series on an introduction to Blockchain, Ethereum, and Smart Contracts. This repo will take you through how to deploy an application on an ethereum blockchain network, understand the languages terminology and jargon, advantages, and problems it’s trying to solve. This lecture series will place an emphasis to explain the important semantic concepts of solidity and it's architecture in detail.

Details regarding solidity concepts like externally owned accounts, contract accounts, its currency in terms of gas and Ether will be discussed. Ethereum is heavily based on cryptography and you’ll also learn about hash, encryption, and usage of keys for creating transactions and accounts. How are transactions and accounts created, how gas is paid for each transaction, difference between message calls and transactions, and storage of code and state management will be explained in detailed.  All information within this repo has been allocated from the follow two sources.

[solidity documentation](https://docs.soliditylang.org/_/downloads/en/latest/pdf/)

[geth documentation](https://github.com/ethereum/go-ethereum)

## directory tree

```
.
└── lectures                      
│   │
│   ├── lecture-00
│   │   └── README.md               # intro to smart contracts and enviromental configuration
│   │       │
│   │       ├── figures             # console images for installing ethereum and geth
│   │       ├── coin.sol            # primitive cryptocurency
│   │       ├── counter.sol         # primitive smart contract
│   │       ├── simple.sol          # simple storage smart contract
│   │       └── hello-world.sol     # hello world smart contract
│   │
│   └── lecture-01
│       └── README.md               # private network set up
│       ├── example.json            # manual set up of configs - gaslimit, chainid : 12345
│       ├── /figures                # terminal output png
│       └── /genesis                # experimental genesis nodes
│
├── network
│   └── README.md                   # a simple private network of two nodes
│       │
│       ├── /morgannetwork          # manual set up of configs - gaslimit, chainid : 3168063999
|       |
│       ├── /node1                  # **address** 0xd087f43F069920b9a3e101837C2B1A432A671e47
|       |   ├── /password           # password
|       |   ├── /keystore           # secret key file path
│       |   └── /data              
│       |
│       |
│       ├── /node2                  # **address** 0x0768ab569F4EFD35CbB39f3C58f921b9A1A7A1Fd
|       |   ├── /password           # password
|       |   ├── /keystore           # secret key file path
│       |   └── /data              
|       |
│       ├── /bnode                  # bootnode 
|       |   └── boot.key            # **value** df71265635211b704d1aa12ea018296e0f4f5c4048063e25f5519826b9ee1c57
│       │
│       └── /assets                 
│
└── ...
```
