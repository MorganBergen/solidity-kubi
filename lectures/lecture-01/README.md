# `lecture-01`

## Creating a Private Test Network

Introduction to solidity programming language
Morgan Bergen, B.S. Computer Science - Director of Education [University of Kansas Blockchain Institute](https://kublockchain.com)

### Learning Objectives

By the end of this lecture you will have set a private network of multiple Geth nodes. An ethereum network is private if the nodes are not connected to the main network. Private only means reserved or isolated, rather than protected or secure. A fully controlled, private ethereum network is useful as a backend for core developers working on issues relating to networking/blockchain syncing. Private networks are also useful for Dapp developers testing multi-block and multi-user scenarios.

Geth is an Ethereum client written in the Go programming language. Geth turns a computer into an Ethereum node. Ethereum is a peer-to-peer network where information is shared directly between nodes rather than being managed by a central server. Nodes compete to generate new blocks of transactions to send to its peers because they are rewarded for doing so in Ethereum's native token, ether (ETH). On receiving a new block, each node checks that it is valid and adds it to their database. The sequence of discrete blocks is called a "blockchain".

The information provided in each block is used by Geth to update its “state” - the ether balance of each account on Ethereum. There are two types of account: externally-owned accounts (EOAs) and contract accounts. Contract accounts execute contract code when they receive transactions. EOAs are accounts that users manage locally in order to sign and submit transactions. Each EOA is a public-private key pair, where the public key is used to derive a unique address for the user and the private key is used to protect the account and securely sign messages. Therefore, in order to use Ethereum, it is first necessary to generate an EOA (hereafter, “account”). This tutorial will guide the user through creating an account, funding it with ether and sending some to another address.

A private network is composed of multiple Ethereum nodes that can only connect to each other. In order to run multiple nodes locally, each one requires a separate data directory `--datadir`. The nodes must also know about each other and be able to exchange information, share an initial state and a common consensus algorithm.

# Overview

[step 0: configure Geth](https://github.com/MorganBergen/solidity-kubi/tree/main/lectures/lecture-01#step-0-configure-geth)

[step 1: generating accounts](https://github.com/MorganBergen/solidity-kubi/tree/main/lectures/lecture-01#step-1-generating-accounts)

## step 0: configure Geth

Step 0 will explored the various options for configuring a local private network. This step will show how to set up and launch a private network, unlock the associated accounts, attach a console to check the network status and make some basic interactions.

**Learning Objectives:**

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

**Following Steps:**

1. Choose a Network ID

Ethereum Mainnet has it's network ID = 1. There are many other networks that Geth can connect to by providing alternative Chain IDs, some are testnets and others are alternative networks built from forks of the Geth source code. Providing a network ID that is not already being used by an existing network or testnet means the nodes using that network ID can only connect to each other, creating a private network. A list of current network IDs is available at [chainlist.org](https://chainlist.org). The network ID is controlled using then networkid flag. insert -> figure-1.1.png & figure-1.2.png

```console
owner@morgan Ethereum % geth --networkid 12345
INFO [08-10|12:29:23.572] Maximum peer count                       ETH=50 LES=0 total=50
INFO [08-10|12:29:23.576] Set global gas cap                       cap=50,000,000
INFO [08-10|12:29:23.578] Allocated trie memory caches             clean=154.00MiB dirty=256.00MiB
INFO [08-10|12:29:23.578] Allocated cache and file handles         database=/Users/owner/Library/Ethereum/geth/chaindata cache=512.00MiB handles=5120
INFO [08-10|12:29:23.949] Opened ancient database                  database=/Users/owner/Library/Ethereum/geth/chaindata/ancient readonly=false
INFO [08-10|12:29:23.965]
INFO [08-10|12:29:23.966] ---------------------------------------------------------------------------------------------------------------------------------------------------------
INFO [08-10|12:29:23.966] Chain ID:  1 (mainnet)
INFO [08-10|12:29:23.966] Consensus: Ethash (proof-of-work)
INFO [08-10|12:29:23.966]
INFO [08-10|12:29:23.966] Pre-Merge hard forks:
INFO [08-10|12:29:23.966]  - Homestead:                   1150000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/homestead.md)
INFO [08-10|12:29:23.966]  - DAO Fork:                    1920000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/dao-fork.md)
INFO [08-10|12:29:23.966]  - Tangerine Whistle (EIP 150): 2463000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/tangerine-whistle.md)
INFO [08-10|12:29:23.966]  - Spurious Dragon/1 (EIP 155): 2675000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/spurious-dragon.md)
INFO [08-10|12:29:23.966]  - Spurious Dragon/2 (EIP 158): 2675000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/spurious-dragon.md)
INFO [08-10|12:29:23.966]  - Byzantium:                   4370000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/byzantium.md)
INFO [08-10|12:29:23.966]  - Constantinople:              7280000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/constantinople.md)
INFO [08-10|12:29:23.966]  - Petersburg:                  7280000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/petersburg.md)
INFO [08-10|12:29:23.966]  - Istanbul:                    9069000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/istanbul.md)
INFO [08-10|12:29:23.966]  - Muir Glacier:                9200000  (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/muir-glacier.md)
INFO [08-10|12:29:23.966]  - Berlin:                      12244000 (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/berlin.md)
INFO [08-10|12:29:23.966]  - London:                      12965000 (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/london.md)
INFO [08-10|12:29:23.966]  - Arrow Glacier:               13773000 (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/arrow-glacier.md)
INFO [08-10|12:29:23.966]  - Gray Glacier:                15050000 (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/gray-glacier.md)
INFO [08-10|12:29:23.966]
INFO [08-10|12:29:23.966] The Merge is not yet available for this network!
INFO [08-10|12:29:23.966]  - Hard-fork specification: https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/paris.md)
INFO [08-10|12:29:23.966] ---------------------------------------------------------------------------------------------------------------------------------------------------------
INFO [08-10|12:29:23.966]
INFO [08-10|12:29:23.968] Disk storage enabled for ethash caches   dir=/Users/owner/Library/Ethereum/geth/ethash count=3
INFO [08-10|12:29:23.968] Disk storage enabled for ethash DAGs     dir=/Users/owner/Library/Ethash count=2
INFO [08-10|12:29:23.969] Initialising Ethereum protocol           network=12345 dbversion=8
INFO [08-10|12:29:23.970] Loaded most recent local header          number=14463 hash=0f5a32..a0ad66 td=5,554,539,276,154,302 age=7y1mo2w
INFO [08-10|12:29:23.971] Loaded most recent local full block      number=0     hash=d4e567..cb8fa3 td=17,179,869,184        age=53y4mo2w
INFO [08-10|12:29:23.971] Loaded most recent local fast block      number=14463 hash=0f5a32..a0ad66 td=5,554,539,276,154,302 age=7y1mo2w
INFO [08-10|12:29:23.971] Loaded last fast-sync pivot marker       number=15,272,588
WARN [08-10|12:29:23.971] Snapshot maintenance disabled (syncing)
INFO [08-10|12:29:23.972] Loaded local transaction journal         transactions=0 dropped=0
INFO [08-10|12:29:23.972] Regenerated local transaction journal    transactions=0 accounts=0
INFO [08-10|12:29:23.972] Upgrading chain index                    type=bloombits percentage=0
INFO [08-10|12:29:23.973] Gasprice oracle is ignoring threshold set threshold=2
WARN [08-10|12:29:23.976] Unclean shutdown detected                booted=2022-08-10T12:28:12-0500 age=1m11s
WARN [08-10|12:29:23.977] Unclean shutdown detected                booted=2022-08-10T12:28:21-0500 age=1m2s
WARN [08-10|12:29:23.977] Unclean shutdown detected                booted=2022-08-10T12:29:22-0500 age=1s
WARN [08-10|12:29:23.977] Engine API enabled                       protocol=eth
WARN [08-10|12:29:23.977] Engine API started but chain not configured for merge yet
ERROR[08-10|12:29:24.016] Section processing failed                type=bloombits error="canonical block #1991 unknown"
Fatal: Database has receipts with a legacy format. Please run `geth db freezer-migrate`.

```

2. Choose a Consensus Algorithm
3. Creating the Genesis Block
4. Initializing the Geth Database
5. Scheduling Hard Forks
6. Setting up Networking
7. Running member Nodes
8. Running A Signer (Clique)
9. Running A Miner (Ethash)
10. End-to-end Example

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

Geth account will manage accounts, list all existing accounts, import a private key into a new account, and create a new account or update an existing account The `geth account` command supports an interactive mode, when you are prompted for password as well as non-interactive mode where passwords are supplied via a given password file. Non-interactive mode is only meant for scripted use on test networks or known safe enviroments. Make sure you remember the password you gave when creating a new account (eith either new or import). Without it you are not able to unlock your account. Keys are stored under `<DATADIR>/keystore`. Make sure you backup your keys regularly. It is safe to transfer the enire directory of the individual keys therein between ethereum nodes by simply coping. figure-1.0.png

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

```

```

```

```

```

```
