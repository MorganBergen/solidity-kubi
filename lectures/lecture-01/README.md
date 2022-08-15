# `lecture-01`

## Creating a Private Test Network

Introduction to solidity programming language
Morgan Bergen, B.S. Computer Science - Director of Education [University of Kansas Blockchain Institute](https://kublockchain.com)

[here 0](https://geth.ethereum.org/docs/interface/private-network)
[here 1](https://geth.ethereum.org/docs/getting-started)

### Learning Objectives

By the end of this lecture you will have set a private network of multiple Geth nodes. An ethereum network is private if the nodes are not connected to the main network. Private only means reserved or isolated, rather than protected or secure. A fully controlled, private ethereum network is useful as a backend for core developers working on issues relating to networking/blockchain syncing. Private networks are also useful for Dapp developers testing multi-block and multi-user scenarios.

Geth is an Ethereum client written in the Go programming language. Geth turns a computer into an Ethereum node. Ethereum is a peer-to-peer network where information is shared directly between nodes rather than being managed by a central server. Nodes compete to generate new blocks of transactions to send to its peers because they are rewarded for doing so in Ethereum's native token, ether (ETH). On receiving a new block, each node checks that it is valid and adds it to their database. The sequence of discrete blocks is called a "blockchain".

The information provided in each block is used by Geth to update its “state” - the ether balance of each account on Ethereum. There are two types of account: externally-owned accounts (EOAs) and contract accounts. Contract accounts execute contract code when they receive transactions. EOAs are accounts that users manage locally in order to sign and submit transactions. Each EOA is a public-private key pair, where the public key is used to derive a unique address for the user and the private key is used to protect the account and securely sign messages. Therefore, in order to use Ethereum, it is first necessary to generate an EOA (hereafter, “account”). This tutorial will guide the user through creating an account, funding it with ether and sending some to another address.

A private network is composed of multiple Ethereum nodes that can only connect to each other. In order to run multiple nodes locally, each one requires a separate data directory `--datadir`. The nodes must also know about each other and be able to exchange information, share an initial state and a common consensus algorithm.

# Overview

[step 0: configure Geth](https://github.com/MorganBergen/solidity-kubi/tree/main/lectures/lecture-01#step-0-configure-geth)

[step 1: generating accounts](https://github.com/MorganBergen/solidity-kubi/tree/main/lectures/lecture-01#step-1-generating-accounts)

# step 0: configure Geth

Geth is the main Ethereum CLI client tool. It is the entry point into the Ethereum network (mainnet, privatenet, or testnet) all capable of running as a full node (as the default), archive node (retaining all historial states), or a light node (retrieving data live). It can be used by other processes as a gateway into the Ethereum network via JSON RPC endpoints exposed on top of HTTP, WebSockets, and IPC transports.

We will explore the various options for configuring a local private network. This step will show how to set up and launch a private network, unlock the associated accounts, attach a console to check the network status and make some basic interactions.

### Learning Objectives:

1.  Choose a Network ID
2.  Choose a Consensus Algorithm
3.  Creating the Genesis Block
4.  Initializing the Geth Database
5.  Scheduling Hard Forks
6.  Setting up Networking
7.  Running member Nodes
8.  Running A Signer (Clique)
9.  Running A Miner (Ethash)
10. End-to-end Example

### 1. Choose a Network ID

Ethereum Mainnet has it's network ID = 1. There are many other networks that Geth can connect to by providing alternative Chain IDs, some are testnets and others are alternative networks built from forks of the Geth source code. Providing a network ID that is not already being used by an existing network or testnet means the nodes using that network ID can only connect to each other, creating a private network. A list of current network IDs is available at [chainlist.org](https://chainlist.org). The network ID is controlled using then networkid flag.

<img src="https://github.com/MorganBergen/solidity-kubi/blob/main/lectures/lecture-01/figures/figure-1.1.png">

### 2. Choose a Consensus Algorithm

While the mainnetwork uses proof-of-work (PoW) to secure the blockchain, Geth also supports the 'Clique' proof-of-authority (PoA) consensus algorithm as an alternative for private networks. Clique is strongly recommended for private testnets because PoA is far less resource-intensive than PoW. Clique is currently used as the consensus algorithm in public testnets such as Rinkeby and Görli Information regarding the Clique consensus algorithm is available here -> [Clique](https://eips.ethereum.org/EIPS/eip-225)

**Clique** consensus is a PoA system where new blocks can be created by authoried 'signers' only. The clique consensus protocol is specified in EIP-225. The initial set of aurthozied signers is configured in the genesis block. Signers can be authorized and de-authorized using a voting mechanism. therefore allowing the set of signers to change while the blockchain operates. Clique can be configured to target any block time since it isn't tied to the difficulty adjustment.

### 3. Creating the Genesis Block

Every blockchain starts with a genesis block. When Geth is run with default settings for the firts time, it commits the Mainnet genesis to the database. For a private network, it is generally preferable to use a different genesis block. The genesis block is configured using a `genesis.json` file whose path must be provided to Geth on start-up. When creating a genesis block, a few initial parameters for the private blockchain must be well defined:

**Parameters**

1. **`config`** Ethereum platform features enable at launch `config`. Enabling and disabling features once the blockchain is running requires scheduling a hard fork

- **"hard fork"** A hard fork is a permanent divergence in the blockchain; also kwon as a hard forking change. One commonly occurs when nonupgraded nodes can't validate blocks created by upgraded nodes that follow newer consensus rules. This is not to be confused with the term "Git fork"

2. `gaslimit`
   Initial block gas limit is in variable `gasLimit`. This impacts how much EVM computation can happen within a single block. Mirroring the main Ethereum network is generally a good choice, the block gas limit can be adjusted after launching the `--miner.gastarget`

3. `alloc`
   `alloc` is the initial allocation of ether. It determines how much ether is available to the addresses listed in the genesis block. Additional ether can be created through mining as the chain progresses.

```
geth account new --datadir data
```

### 4. Initializing the Geth Database

### 5. Scheduling Hard Forks

### 6. Setting up Networking

### 7. Running member Nodes

### 8. Running A Signer (Clique)

### 9. Running A Miner (Ethash)

### 10. End-to-end Example

## step 1: generating accounts

```console

owner@morgan Ethereum % pwd
/Users/owner/Library/Ethereum
owner@morgan Ethereum % geth account -help
NAME:
   geth account - Manage accounts

USAGE:
   geth account command [command options] [arguments...]

DESCRIPTION:
   Manage accounts, list all existing accounts, import a private key into a new
   account, create a new account or update an existing account.

   It supports interactive mode, when you are prompted for password as well as
   non-interactive mode where passwords are supplied via a given password file.
   Non-interactive mode is only meant for scripted use on test networks or known
   safe environments.

   Make sure you remember the password you gave when creating a new account (with
   either new or import). Without it you are not able to unlock your account.

   Note that exporting your key in unencrypted format is NOT supported.

   Keys are stored under <DATADIR>/keystore.
   It is safe to transfer the entire directory or the individual keys therein
   between ethereum nodes by simply copying.

   Make sure you backup your keys regularly.

COMMANDS:
   list     Print summary of existing accounts
   new      Create a new account
   update   Update an existing account
   import   Import a private key into a new account
   help, h  Shows a list of commands or help for one command

OPTIONS:
    --help, -h                     (default: false)
          show help

```

---

1.  NAME:

```console
    geth account - Manage accounts

```

2.  USAGE:

```console
    geth account command [command options] [arguments...]
```

3.  COMMANDS:

```console

    list        Print summary of existing accounts
    new         Create a new account
    update      Update an existing account
    import      Import a private key into a new account
    help, h     Shows a list of commands or help for one command

```

4.  OPTIONS:

```console
    --help, -h  show help
```

5.  DESCRIPTION:

Manage accounts lets you create new accounts, list all existing accounts, import a private key into a new account, migrate to newest key format and change your password. The `geth account` command supports an interactive mode, when you are prompted for password as well as non-interactive mode where passwords are supplied via a given password file. Non-interactive mode is only meant for scripted use on test networks or known safe enviroments. Make sure you remember the password you gave when creating a new account (eith either new or import). Without it you are not able to unlock your account. Keys are stored under `<DATADIR>/keystore`. Make sure you backup your keys regularly. It is safe to transfer the enire directory of the individual keys therein between ethereum nodes by simply coping. figure-1.0.png

To generate a new account in Geth.

```

geth account new

```

This will return a prompt for a password. Once provided, a new account will be created and added to the default keystore (`/datadir/keystore`). A custom keystore can also be provided by passing `--keystore <path>`. In this short tutorial we will be storing keys in a new data directory `geth-tutorial`. Create the directory, then run:

```

geth accout new --keystore geth-tutorial/keystore

```

It is important to save the account address and the password somewhere secure. They will be used again soon in further steps. Please note that the account address shown below

'''

'''

# ------------------------------------------

#### IV. Creating a Private Test Network

A private network is composed of multiple Ethereum nodes that can only connect to each other. In order to run multiple nodes locally, each one requires a separate data directory (--datadir). The nodes must also know about each other and be able to exchange information, share an initial state and a common consensus algorithm. The remainder of this page will explain how to configure Geth so that these basic requirements are met, enabling a private network to be started. After you have installed Geth, it can be configured to run locally without connecting to any network on the internet. Every chain and network has a genesis block or first block. This block does not have a parent and emulates a head node of a linkedList data structure. This block is conventionally called the genesis block and `genesis.json` file is required to create this first block. figure-1.1.png

1. create the first/genesis block **`genesis.json`**

```

{
"config" : {
"chainID": 999,
"homesteadBlock": 0,
"eip155Block": 0,
"eip158Block": 0,
"byzantiumBlock": 0,
"constantinopleBlock": 0,
"petersburgBlock": 0,
"istanbulBlock": 0,
"ethash":{}
},
"nonce": "0x0",
"timestamp": "0x62272fde",
"extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
"gasLimit": "0x47b760",
"difficulty": "0x0",
"mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
"coinbase": "0x0000000000000000000000000000000000000000",
"alloc": {},
"number": "0x0",
"gasUsed": "0x0",
"parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
"baseFeePerGas": null
}

```

2.  Initialize the private network

    `genesis.json` file should be passed to geth to initiaze your private network. The geth node also needs to store the blockchain data and account keys. This information should also be provided to Geth while initializing the private network.

3.  Command Line Input for network initialization

The following `geth init` command initializes the node with the `genesis.json` file and target data directory location to store the chain data and key store information:

`init Bootstrap and initialize a new genesis block`

`-th init ./genesis.json --datadir=./`
`geth init ./genesis.json --datadir=./`

##### BREAK HERE WILL BE BACK TOMORROW I NEED HELP WITH FOLLOW ERR

`Fatal: failed to write genesis block: database contains incompatible genesis`

https://ethereum.stackexchange.com/questions/17202/fatal-failed-to-write-genesis-block-wrong-genesis-block-in-database

```

owner@morgan Ethereum % ls
genesis.json geth keystore
owner@morgan Ethereum % geth init genesis.json
INFO [08-03|19:35:44.720] Maximum peer count ETH=50 LES=0 total=50
INFO [08-03|19:35:44.726] Set global gas cap cap=50,000,000
INFO [08-03|19:35:44.727] Allocated cache and file handles database=/Users/owner/Library/Ethereum/geth/chaindata cache=16.00MiB handles=16
INFO [08-03|19:35:47.193] Opened ancient database database=/Users/owner/Library/Ethereum/geth/chaindata/ancient readonly=false
INFO [08-03|19:35:47.206] Persisted trie from memory database nodes=0 size=0.00B time="196.417µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
Fatal: Failed to write genesis block: database contains incompatible genesis (have d4e56740f876aef8c010b86a40d5f56745a118d0906a34e69aec8c0db1cb8fa3, new bd71b8d9165ecac47d33e22558fa4bb2397e800ab47ef36b0fdbb23856c2546c)
owner@morgan Ethereum %

```

#### IV. Creating a Private Test Network

#### IV. `Hello World`

- Ethereum network
- Intsalling and Configuring Geth
- Creating a private network
- Intsalling ganache-cli
- Installing the solidity compiler
- Installing the web3 framework
- Installing and working with MetaMask

# End-to-end example

1. `mkdir node1 node2`

2. `geth -datadir node1 account new`
3. `geth -datadir node2 account new`

- this command will have an associated account that will receive some ether at launch
- the following command creates an account for node1
- the keyfile and account password should be backup securely.

# node1

Public address of the key: 0xBE09CDd12e7A08E7eBb8837A8A36117baf97EB18
Path of the secret key file: node1/keystore/UTC--2022-08-15T15-37-03.405888000Z--be09cdd12e7a08e7ebb8837a8a36117baf97eb1

# node2

Public address of the key: 0x8ce72b1252D335a36fb950Bb92412Bd5205378Eb
Path of the secret key file: node2/keystore/UTC--2022-08-15T15-43-10.830856000Z--8ce72b1252d335a36fb950bb92412bd5205378e

```
geth
│
├── node1: "be09cdd12e7a08e7ebb8837a8a36117baf97eb18"
│   │
│   ├── keystore
│   │   └── UTC--2022-08-15T15-37-03.405888000Z--be09cdd12e7a08e7ebb8837a8a36117baf97eb18
│   │
│   ├── genesis.json
│   └── password.txt    # node1 - 0xBE09CDd12e7A08E7eBb8837A8A36117baf97EB18
│                       # passcode - password
│
│
├── node2:  "8ce72b1252d335a36fb950bb92412bd5205378eb"
│   │
│   ├── keystore
│   │   └── UTC--2022-08-15T15-43-10.830856000Z--8ce72b1252d335a36fb950bb92412bd5205378eb
│   │
│   ├── genesis.json
│   └── password.txt    # node2 - 0x8ce72b1252D335a36fb950Bb92412Bd5205378Eb
|                       # passcode - password
│
└── .


./geth --datadir node1 --port 30306 --bootnodes enode://f7aba85ba369923bffd3438b4c8fde6b1f02b1c23ea0aac825ed7eac38e6230e5cadcf868e73b0e28710f4c9f685ca71a86a4911461637ae9ab2bd852939b77f@127.0.0.1:0?discport=30305  --networkid 123454321 --unlock 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b --password node1/password.txt

```

```

In order to unlock the accounts later the passwords for each account should be saved in a text file in each node's data directory.
The account address in the `alloc` field should be replaced with those created for each node in the previous step without the leading 0x.

"alloc": {
    "be09cdd12e7a08e7ebb8837a8a36117baf97eb18": { "balance": "300000" },
    "8ce72b1252d335a36fb950bb92412bd5205378eb": { "balance": "400000" }
  }

The account address in the `alloc` field should be replaced with those creaed for each node in the previous step.
Public address of the key: 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b
Path of the secret key file: node1/keystore/UTC--2022-05-13T14-25-49.229126160Z--c1b2c0dfd381e6ac08f34816172d6343decbb12b

```

`geth init --datadir node1 genesis.json`

```console

owner@morgan node1 % ls
genesis.json	keystore	password.txt
owner@morgan node1 % geth init --datadir node1 genesis.json
INFO [08-15|11:43:00.355] Maximum peer count                       ETH=50 LES=0 total=50
INFO [08-15|11:43:00.360] Set global gas cap                       cap=50,000,000
INFO [08-15|11:43:00.361] Allocated cache and file handles         database=/Users/owner/Library/Ethereum/node1/node1/geth/chaindata cache=16.00MiB handles=16
INFO [08-15|11:43:00.644] Opened ancient database                  database=/Users/owner/Library/Ethereum/node1/node1/geth/chaindata/ancient readonly=false
INFO [08-15|11:43:00.646] Writing custom genesis block
INFO [08-15|11:43:00.651] Persisted trie from memory database      nodes=3 size=397.00B time="328.416µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [08-15|11:43:00.654] Successfully wrote genesis state         database=chaindata hash=3b2f11..39e4ec
INFO [08-15|11:43:00.654] Allocated cache and file handles         database=/Users/owner/Library/Ethereum/node1/node1/geth/lightchaindata cache=16.00MiB handles=16
INFO [08-15|11:43:00.898] Opened ancient database                  database=/Users/owner/Library/Ethereum/node1/node1/geth/lightchaindata/ancient readonly=false
INFO [08-15|11:43:00.899] Writing custom genesis block
INFO [08-15|11:43:00.900] Persisted trie from memory database      nodes=3 size=397.00B time="511.292µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [08-15|11:43:00.903] Successfully wrote genesis state         database=lightchaindata hash=3b2f11..39e4ec
owner@morgan node1 % pwd
/Users/owner/Library/Ethereum/node1
owner@morgan node1 %

```

You can use the `geth init` command in order to set up the genesis file.
The next step is to configure a bootnode, this can be any node, but for this tutorial the developer tool
`bootnode`

```
enode://8fe73c36ca69f73394df862309d39894d1f4d417f6e7498a424c906db4d8d92982faf7aa5b0fc1f4db8339c1101e0105ec452b636b9011172f32d00c80fcfa89@127.0.0.1:0?discport=30305

```

```console
owner@morgan Ethereum % geth account list
INFO [08-15|12:31:49.919] Maximum peer count                       ETH=50 LES=0 total=50
INFO [08-15|12:31:49.923] Set global gas cap                       cap=50,000,000
Account #0: {8ce72b1252d335a36fb950bb92412bd5205378eb} keystore:///Users/owner/Library/Ethereum/keystore/UTC--2022-08-15T15-37-03.405888000Z--be09cdd12e7a08e7ebb8837a8a36117baf97eb18
Account #1: {8ce72b1252d335a36fb950bb92412bd5205378eb} keystore:///Users/owner/Library/Ethereum/keystore/UTC--2022-08-15T15-43-10.830856000Z--8ce72b1252d335a36fb950bb92412bd5205378eb
owner@morgan Ethereum % pwd
/Users/owner/Library/Ethereum

```

Public address of the key: 0x8ce72b1252D335a36fb950Bb92412Bd5205378Eb
Path of the secret key file: node2/keystore/UTC--2022-08-15T15-43-10.830856000Z--8ce72b1252d335a36fb950bb92412bd5205378eb
