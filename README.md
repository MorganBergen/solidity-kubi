<img align="left" width=10% src="/assets/KU-Blockchain-logo.svg">

# `learn solidity with KUBI`
![maintenance-status](https://img.shields.io/badge/maintenance-experimental-blue.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-passively--maintained-yellowgreen.svg)
![maintenance-status](https://img.shields.io/badge/maintenance-looking--for--maintainer-orange.svg)

## Introduction to solidity programming language

Morgan Bergen, B.S. Computer Science - Director of Education

[ **University of Kansas Blockchain Institute** ](https://kublockchain.com)

### Description

A multi part lecture series on an introduction to Blockchain, Ethereum, and Smart Contracts. This repo will take you through how to deploy an application on an ethereum blockchain network, understand the languages terminology and jargon, advantages, and problems it’s trying to solve. This lecture series will place an emphasis to explain the important semantic concepts of solidity and it's architecture in detail.

Details regarding solidity concepts like externally owned accounts, contract accounts, its currency in terms of gas and Ether will be discussed. Ethereum is heavily based on cryptography and you’ll also learn about hash, encryption, and usage of keys for creating transactions and accounts. How are transactions and accounts created, how gas is paid for each transaction, difference between message calls and transactions, and storage of code and state management will be explained in detailed.  All information within this repo has been allocated from the follow two sources.

## Sources
1.  [solidity documentation](https://docs.soliditylang.org/_/downloads/en/latest/pdf/)
2.  [geth documentation](https://github.com/ethereum/go-ethereum)

![blockchain](https://user-images.githubusercontent.com/65584733/188204955-0a0d20c3-867f-4e65-8bf3-1b3422e227ab.png)

### Directory Tree

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

```zsh
.
├── README.md
├── assets
│   ├── KU-Blockchain-logo.svg
│   ├── blockchain.png
│   └── solidity
│       ├── book
│       │   └── compiler.png
│       ├── docs.pdf
│       ├── intro
│       │   └── coin.png
│       └── src
│           ├── Chapter01
│           │   └── HelloWorld.sol
│           ├── Chapter03
│           │   ├── AllAboutInts.sol
│           │   ├── BoolContract.sol
│           │   ├── BytesContract.sol
│           │   ├── Contracts.sol
│           │   ├── EnumContract.sol
│           │   ├── GeneralMapping.sol
│           │   ├── GeneralStructure.sol
│           │   ├── GeneralStructure1.sol
│           │   ├── InnerMapping.sol
│           │   ├── MappingLooping.sol
│           │   ├── MappingMemory.sol
│           │   ├── MemoryToMemoryReferenceTypeAssignment.sol
│           │   ├── MemoryToMemoryValueTypeAssignment.sol
│           │   ├── MemoryToStorageReferenceTypeAssignment.sol
│           │   ├── MemoryToStorageValueTypeAssignment.sol
│           │   ├── PragmaAndComments.sol
│           │   ├── StorageToMemoryReferenceTypeAssignment.sol
│           │   ├── StorageToStorageReferenceTypeAssignment.sol
│           │   ├── StorageToStorageValueTypeAssignment.sol
│           │   ├── StorageTomemoryValueTypeAssignment.sol
│           │   └── darray.sol
│           ├── Chapter04
│           │   ├── CryptoFunctions.sol
│           │   ├── ErrorDataType.sol
│           │   ├── ExplicitConversion.sol
│           │   ├── ScopingStateVariable.sol
│           │   ├── TransactionAndMessageVariables.sol
│           │   └── ecrecover.sol
│           ├── Chapter05
│           │   ├── DoWhileLoop.sol
│           │   ├── ForLoop.sol
│           │   ├── ForLoopWithBreak.sol
│           │   ├── ForLoopWithContinue.sol
│           │   ├── IfElseConditional.sol
│           │   ├── Returnvalues.sol
│           │   └── whileLoop .sol
│           ├── Chapter06
│           │   ├── AbstractContracts.sol
│           │   ├── Address.sol
│           │   ├── Constructor.sol
│           │   ├── ContractPolymorphism.sol
│           │   ├── FunctionPolymorphism.sol
│           │   ├── GeneralStructure.sol
│           │   ├── HelloWorld.sol
│           │   ├── IMath.sol
│           │   ├── Inheritance.sol
│           │   ├── Interfaces.sol
│           │   ├── LibraryClient.sol
│           │   ├── Mathematics.sol
│           │   ├── MultipleInheritance.sol
│           │   ├── myclient.sol
│           │   └── mylib.sol
│           ├── Chapter07
│           │   ├── ContractWithModifier.sol
│           │   ├── ContractWithoutModifier.sol
│           │   ├── FallbackAndReceive.sol
│           │   ├── Parameters.sol
│           │   ├── PureFunction.sol
│           │   ├── SendAndTransferSample.sol
│           │   ├── SimpleFallback.sol
│           │   ├── UsingCallFunction.sol
│           │   └── ViewFunction.sol
│           ├── Chapter08
│           │   ├── CustomErrorRevert.sol
│           │   ├── EventContract.sol
│           │   ├── MoreRequireUsageContract.sol
│           │   ├── Order.sol
│           │   ├── OrderContract.sol
│           │   ├── OverflowCheckContract.sol
│           │   ├── RequireRefactoredContract.sol
│           │   ├── RequireUsageContract.sol
│           │   ├── RevertContract.sol
│           │   ├── SimpleRequireContract.sol
│           │   ├── eventPromise.js
│           │   └── trycatch.sol
│           ├── Chapter09
│           │   └── TruffleProject
│           │       ├── assert.sol
│           │       ├── build
│           │       │   └── contracts
│           │       │       ├── First.json
│           │       │       ├── Migrations.json
│           │       │       └── Second.json
│           │       ├── contracts
│           │       │   ├── Migrations.sol
│           │       │   ├── first.sol
│           │       │   └── second.sol
│           │       ├── migrations
│           │       │   ├── 1_initial_migration.js
│           │       │   └── 2_Custom.js
│           │       ├── test
│           │       │   └── TestFirst.sol
│           │       └── truffle-config.js
│           ├── Chapter10
│           │   └── DebuggerSampleContract.sol
│           ├── Chapter11
│           │   ├── Assemblyscopes.sol
│           │   ├── CallingContract.sol
│           │   ├── MemoryAssembly.sol
│           │   ├── ReturningValues.sol
│           │   ├── SimpleAssembly.sol
│           │   └── StorageAssembly.sol
│           ├── Chapter12
│           │   ├── DependencyContracts.sol
│           │   ├── DependencywithConstructorInstance.sol
│           │   ├── ProblematicContract.sol
│           │   ├── UpgradableProxyContracts.sol
│           │   ├── UpgradableStorage.sol
│           │   ├── UpgradableWithComposition.sol
│           │   ├── UpgradableWithInheritance.sol
│           │   └── UpgradbaleProxyContracts.sol
│           ├── Chapter13
│           │   ├── Reentrancy.sol
│           │   ├── Solution_Reentrancy.sol
│           │   └── under_overflow.sol
│           ├── Chapter14
│           │   ├── ERC223Recipient.sol
│           │   ├── ERC721.sol
│           │   └── WorldToken.sol
│           ├── Chapter15
│           │   ├── AssetOwnerTransfer.sol
│           │   ├── DataModeling.sol
│           │   ├── MultipleOwnership.sol
│           │   ├── MultisigContract.sol
│           │   ├── Ownsership.sol
│           │   ├── StoppableContract.sol
│           │   └── TransferrableOwnership.sol
│           ├── LICENSE
│           └── README.md
└── lectures
    ├── lecture-00
    │   ├── README.md
    │   ├── coin.sol
    │   ├── counter.sol
    │   ├── figures
    │   │   ├── brew-install.png
    │   │   ├── geth--mainnet.png
    │   │   ├── geth--mainnet.txt
    │   │   └── geth-help.txt
    │   ├── hello-world.sol
    │   ├── main.sol
    │   └── simple.sol
    ├── lecture-01
    │   ├── README.md
    │   ├── example.json
    │   ├── figures
    │   │   ├── figure-1.1.png
    │   │   ├── figure-1.2.png
    │   │   ├── figure.1.0.png
    │   │   └── terminaloutput.txt
    │   └── genesis
    │       ├── genesis-0.json
    │       └── genesis-1.json
    ├── lecture-02
    │   └── README.md
    ├── lectures
    │   ├── 00-lecture.key
    │   ├── 01-lecture.key
    │   ├── 02-lecture
    │   │   ├── 02-lecture.001.jpeg
    │   │   ├── 02-lecture.002.jpeg
    │   │   ├── 02-lecture.003.jpeg
    │   │   ├── 02-lecture.004.jpeg
    │   │   ├── 02-lecture.005.jpeg
    │   │   ├── 02-lecture.006.jpeg
    │   │   ├── 02-lecture.007.jpeg
    │   │   ├── 02-lecture.008.jpeg
    │   │   ├── 02-lecture.009.jpeg
    │   │   └── 188204955-0a0d20c3-867f-4e65-8bf3-1b3422e227ab.png
    │   └── 02-lecture.key
    ├── network
    │   ├── README.md
    │   ├── assets
    │   │   ├── file.txt
    │   │   ├── info.txt
    │   │   ├── network-0.png
    │   │   ├── network-1.png
    │   │   ├── network-2.png
    │   │   ├── node1.txt
    │   │   └── node2.txt
    │   ├── bnode
    │   │   └── boot.key
    │   ├── morgannetwork
    │   │   └── morgannetwork.json
    │   ├── node1
    │   │   ├── data
    │   │   │   ├── geth
    │   │   │   │   ├── LOCK
    │   │   │   │   ├── chaindata
    │   │   │   │   │   ├── 000001.log
    │   │   │   │   │   ├── CURRENT
    │   │   │   │   │   ├── LOCK
    │   │   │   │   │   ├── LOG
    │   │   │   │   │   ├── MANIFEST-000000
    │   │   │   │   │   └── ancient
    │   │   │   │   │       ├── FLOCK
    │   │   │   │   │       ├── bodies.0000.cdat
    │   │   │   │   │       ├── bodies.cidx
    │   │   │   │   │       ├── bodies.meta
    │   │   │   │   │       ├── diffs.0000.rdat
    │   │   │   │   │       ├── diffs.meta
    │   │   │   │   │       ├── diffs.ridx
    │   │   │   │   │       ├── hashes.0000.rdat
    │   │   │   │   │       ├── hashes.meta
    │   │   │   │   │       ├── hashes.ridx
    │   │   │   │   │       ├── headers.0000.cdat
    │   │   │   │   │       ├── headers.cidx
    │   │   │   │   │       ├── headers.meta
    │   │   │   │   │       ├── receipts.0000.cdat
    │   │   │   │   │       ├── receipts.cidx
    │   │   │   │   │       └── receipts.meta
    │   │   │   │   ├── lightchaindata
    │   │   │   │   │   ├── 000001.log
    │   │   │   │   │   ├── CURRENT
    │   │   │   │   │   ├── LOCK
    │   │   │   │   │   ├── LOG
    │   │   │   │   │   ├── MANIFEST-000000
    │   │   │   │   │   └── ancient
    │   │   │   │   │       ├── FLOCK
    │   │   │   │   │       ├── bodies.0000.cdat
    │   │   │   │   │       ├── bodies.cidx
    │   │   │   │   │       ├── bodies.meta
    │   │   │   │   │       ├── diffs.0000.rdat
    │   │   │   │   │       ├── diffs.meta
    │   │   │   │   │       ├── diffs.ridx
    │   │   │   │   │       ├── hashes.0000.rdat
    │   │   │   │   │       ├── hashes.meta
    │   │   │   │   │       ├── hashes.ridx
    │   │   │   │   │       ├── headers.0000.cdat
    │   │   │   │   │       ├── headers.cidx
    │   │   │   │   │       ├── headers.meta
    │   │   │   │   │       ├── receipts.0000.cdat
    │   │   │   │   │       ├── receipts.cidx
    │   │   │   │   │       └── receipts.meta
    │   │   │   │   └── nodekey
    │   │   │   └── keystore
    │   │   ├── keystore
    │   │   │   └── UTC--2022-08-15T17-53-18.182256000Z--d087f43f069920b9a3e101837c2b1a432a671e47
    │   │   └── password.txt
    │   └── node2
    │       ├── data
    │       │   ├── geth
    │       │   │   ├── LOCK
    │       │   │   ├── chaindata
    │       │   │   │   ├── 000001.log
    │       │   │   │   ├── CURRENT
    │       │   │   │   ├── LOCK
    │       │   │   │   ├── LOG
    │       │   │   │   ├── MANIFEST-000000
    │       │   │   │   └── ancient
    │       │   │   │       ├── FLOCK
    │       │   │   │       ├── bodies.0000.cdat
    │       │   │   │       ├── bodies.cidx
    │       │   │   │       ├── bodies.meta
    │       │   │   │       ├── diffs.0000.rdat
    │       │   │   │       ├── diffs.meta
    │       │   │   │       ├── diffs.ridx
    │       │   │   │       ├── hashes.0000.rdat
    │       │   │   │       ├── hashes.meta
    │       │   │   │       ├── hashes.ridx
    │       │   │   │       ├── headers.0000.cdat
    │       │   │   │       ├── headers.cidx
    │       │   │   │       ├── headers.meta
    │       │   │   │       ├── receipts.0000.cdat
    │       │   │   │       ├── receipts.cidx
    │       │   │   │       └── receipts.meta
    │       │   │   ├── lightchaindata
    │       │   │   │   ├── 000001.log
    │       │   │   │   ├── CURRENT
    │       │   │   │   ├── LOCK
    │       │   │   │   ├── LOG
    │       │   │   │   ├── MANIFEST-000000
    │       │   │   │   └── ancient
    │       │   │   │       ├── FLOCK
    │       │   │   │       ├── bodies.0000.cdat
    │       │   │   │       ├── bodies.cidx
    │       │   │   │       ├── bodies.meta
    │       │   │   │       ├── diffs.0000.rdat
    │       │   │   │       ├── diffs.meta
    │       │   │   │       ├── diffs.ridx
    │       │   │   │       ├── hashes.0000.rdat
    │       │   │   │       ├── hashes.meta
    │       │   │   │       ├── hashes.ridx
    │       │   │   │       ├── headers.0000.cdat
    │       │   │   │       ├── headers.cidx
    │       │   │   │       ├── headers.meta
    │       │   │   │       ├── receipts.0000.cdat
    │       │   │   │       ├── receipts.cidx
    │       │   │   │       └── receipts.meta
    │       │   │   └── nodekey
    │       │   └── keystore
    │       ├── keystore
    │       │   └── UTC--2022-08-15T18-06-59.657684000Z--0768ab569f4efd35cbb39f3c58f921b9a1a7a1fd
    │       └── password.txt
    └── test.md

56 directories, 253 files
```
