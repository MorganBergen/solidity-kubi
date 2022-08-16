# `lecture-01`

## Creating a Private Test Network

Introduction to solidity programming language
Morgan Bergen, B.S. Computer Science - Director of Education [University of Kansas Blockchain Institute](https://kublockchain.com

This section will run through the commands for setting up a simple private network of two nodes.

### Steps

1.  `mkdir node1 node2`

- Each node will have an associated account that will recieve some ether at launch.
- The following command creates an account for Node1, this will return a request for a password.
- Once a password has been provided the following information is returned to the terminal.

2.  `geth --datadir node1 account new`

3.  `touch node1.txt`

4.  `geth --datadir node2 account new`

5.  `touch node2.txt`

6.  `puppeth`

7.  cd node1
    `geth --datadir ./data init ../morgannetwork.json`

8.  cd node2
    `geth --datadir ./data init ../morgannetwork.json`

connect two nodes and get them onto a network

9.  `mkdir bnode` bnode is short for bootnode

10. `bootnode -genkey boot.key`

11. `bootnode -nodekey boot.key`

`bootnode -nodekey ./boot.key `

`./geth --datadir node1 -port 30301 --bootnode enode://396de4e86a44325d901880408897b13425254f2e3382b780220bc9a09f0a5ff2de2623c09592889f9b3da97f1374838f33ff80bc12409543b656c2f4df7e3851@127.0.0.1:0?discport=30301 --networkid 3168063999 -ipcdisable --syncmode full -rpc --password node1/password.txt`

```dotnetcli

geth --chainId 3168063999 --datadir "./data" --bootnode

enode://396de4e86a44325d901880408897b13425254f2e3382b780220bc9a09f0a5ff2de2623c09592889f9b3da97f1374838f33ff80bc12409543b656c2f4df7e3851@127.0.0.1:0?discport=30301

--port 30303 -ipcdisable --syncmode full -rpc --allow-insecure-unlock

./geth --datadir node1 --port 30306 --bootnodes enode://f7aba85ba369923bffd3438b4c8fde6b1f02b1c23ea0aac825ed7eac38e6230e5cadcf868e73b0e28710f4c9f685ca71a86a4911461637ae9ab2bd852939b77f@127.0.0.1:0?discport=30305  --networkid 123454321 --unlock 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b --password node1/password.txt

https://youtu.be/eYj0vPcZAs8

```

```
+-----------------------------------------------------------+
| Welcome to puppeth, your Ethereum private network manager |
|                                                           |
| This tool lets you create a new Ethereum network down to  |
| the genesis block, bootnodes, miners and ethstats servers |
| without the hassle that it would normally entail.         |
|                                                           |
| Puppeth uses SSH to dial in to remote servers, and builds |
| its network components out of Docker containers using the |
| docker-compose toolset.                                   |
+-----------------------------------------------------------+

Please specify a network name to administer (no spaces, hyphens or capital letters please)

> morgannetwork

Sweet, you can set this via --network=morgannetwork next time!

INFO [08-15|13:34:52.626] Administering Ethereum network name=morgannetwork
WARN [08-15|13:34:52.628] No previous configurations found path=/Users/owner/.puppeth/morgannetwork

```

### node1

**address** 0xd087f43F069920b9a3e101837C2B1A432A671e47
**password** password
**secret key file path**
/Users/owner/Documents/GitHub/solidity-kubi/lectures/network/node1/keystore
/UTC--2022-08-15T17-53-18.182256000Z--d087f43f069920b9a3e101837c2b1a432a671e47

### node2

**address** 0x0768ab569F4EFD35CbB39f3C58f921b9A1A7A1Fd
**password** password
**secret key file path**
/Users/owner/Documents/GitHub/solidity-kubi/lectures/network/node2/keystore
/UTC--2022-08-15T18-06-59.657684000Z--0768ab569f4efd35cbb39f3c58f921b9a1a7a1fd
