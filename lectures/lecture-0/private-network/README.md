![geth](https://geth.ethereum.org/docs/getting-started)

### private network

Guide to setting up a private network of multiple Geth nodes. An ethereum network is private if the nodes are not connected to the main network. Private only means reserved or isolated, rather than protected or secure. A fully controlled, private ethereum network is useful as a backend for core developers working
on issues relating to networking/blockchain syncing. Private networks are also useful for Dapp developers testing multi-block and multi-user scenarios.

Geth is an Ethereum client written in the Go programming language. Geth turns a computer into an Ethereum node. Ethereum is a peer-to-peer network where information is shared directly between nodes rather than being managed by a central server. Nodes compete to generate new blocks of transactions to send to its peers because they are rewarded for doing so in Ethereum's native token, ether (ETH). On receiving a new block, each node checks that it is valid and adds it to their database. The sequence of discrete blocks is called a "blockchain".

The information provided in each block is used by Geth to update its “state” - the ether balance of each account on Ethereum. There are two types of account: externally-owned accounts (EOAs) and contract accounts. Contract accounts execute contract code when they receive transactions. EOAs are accounts that users manage locally in order to sign and submit transactions. Each EOA is a public-private key pair, where the public key is used to derive a unique address for the user and the private key is used to protect the account and securely sign messages. Therefore, in order to use Ethereum, it is first necessary to generate an EOA (hereafter, “account”). This tutorial will guide the user through creating an account, funding it with ether and sending some to another address.

# Step 1: generating accounts

To generate a new account in Geth.

```
geth account new

```

This will return a prompt for a password. Once provided, a new account will be created and added to the default keystore (`/datadir/keystore`). A custom keystore can also be provided by passing `--keystore <path>`. In this short tutorial we will be storing keys in a new data directory `geth-tutorial`. Create the directory, then run:

```
geth accout new --keystore geth-tutorial/keystore
```

It is important to save the account address and the password somewhere secure. They will be used again soon in further steps. Please note that the account address shown below
