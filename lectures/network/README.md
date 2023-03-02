# blockchain network `morgannet` chainID 66046

detailed walk through on how to build your own private blockchain network.  in a real world scenerio a network will require a virtual machine to build, however since this chain is quite small we can build this network on your own personal computer with at least 8 gb of RAM.

the consensus engine that we will be using is clique utilizing the proof-of-authority conensus model.

**contents**

1.  [instantiate nodes](#instantiate-nodes)
2.  [instantiate boot node](#instantiate-boot-node)
3.  [link nodes](#link-nodes)
4.  [build network](#build-network)
5.  [test network](#test-network)

it is always advisable to create a 3 node network.

## instantiate nodes

`geth --datadir ./data account new`

**`node0`**

-  public address of key   `0xdDafC4C7Bc370b02fa7ac036B2d3469Bd0D6490b`
-  path of private key file `data/keystore/UTC--2023-03-01T02-38-51.129408000Z--ddafc4c7bc370b02fa7ac036b2d3469bd0d6490b`
-  password                `password`

**`node1`**

-  public address of key    `0xF4260e2Fe5DBC5252ba67331724f78854DeC6abC`
-  path of private key file  `data/keystore/UTC--2023-03-01T02-40-57.347420000Z--f4260e2fe5dbc5252ba67331724f78854dec6abc`

## genesis file

contains all of the relevant information about our private network

`puppeth` is an inbuilt tool used with `geth`

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

```zsh
INFO [02-28|20:57:30.390] Administering Ethereum network           name=morgannet
WARN [02-28|20:57:30.390] No previous configurations found         path=/Users/owner/.puppeth/morgannet
```

how will i generate consensus blocks?  through the consensus mechanism `clique`

which nodes will authorize transactions, this will be `node0` which is the authority node.  `node0` will mine all the blocks. we will pre-fund the addresses of `node0` and `node1`.  the chain id is 66046

```
geth --datadir ./data init ../morgannet.json
INFO [02-28|21:11:45.550] Maximum peer count                       ETH=50 LES=0 total=50
INFO [02-28|21:11:45.553] Set global gas cap                       cap=50,000,000
INFO [02-28|21:11:45.554] Allocated cache and file handles         database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node0/data/geth/chaindata cache=16.00MiB handles=16
INFO [02-28|21:11:45.633] Opened ancient database                  database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node0/data/geth/chaindata/ancient/chain readonly=false
INFO [02-28|21:11:45.633] Writing custom genesis block
INFO [02-28|21:11:45.639] Persisted trie from memory database      nodes=357 size=50.70KiB time="559.583µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [02-28|21:11:45.640] Successfully wrote genesis state         database=chaindata hash=11dc1e..783e6e
INFO [02-28|21:11:45.640] Allocated cache and file handles         database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node0/data/geth/lightchaindata cache=16.00MiB handles=16
INFO [02-28|21:11:45.717] Opened ancient database                  database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node0/data/geth/lightchaindata/ancient/chain readonly=false
INFO [02-28|21:11:45.717] Writing custom genesis block
INFO [02-28|21:11:45.723] Persisted trie from memory database      nodes=357 size=50.70KiB time="493.708µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [02-28|21:11:45.723] Successfully wrote genesis state         database=lightchaindata hash=11dc1e..783e6e
```

```
❯ geth --datadir ./data init ../morgannet.json
INFO [02-28|21:12:29.236] Maximum peer count                       ETH=50 LES=0 total=50
INFO [02-28|21:12:29.239] Set global gas cap                       cap=50,000,000
INFO [02-28|21:12:29.240] Allocated cache and file handles         database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node1/data/geth/chaindata cache=16.00MiB handles=16
INFO [02-28|21:12:29.330] Opened ancient database                  database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node1/data/geth/chaindata/ancient/chain readonly=false
INFO [02-28|21:12:29.330] Writing custom genesis block
INFO [02-28|21:12:29.336] Persisted trie from memory database      nodes=357 size=50.70KiB time="554.208µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [02-28|21:12:29.336] Successfully wrote genesis state         database=chaindata hash=11dc1e..783e6e
INFO [02-28|21:12:29.336] Allocated cache and file handles         database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node1/data/geth/lightchaindata cache=16.00MiB handles=16
INFO [02-28|21:12:29.417] Opened ancient database                  database=/Users/owner/Documents/Github/solidity-kubi/lectures/large-network/node1/data/geth/lightchaindata/ancient/chain readonly=false
INFO [02-28|21:12:29.417] Writing custom genesis block
INFO [02-28|21:12:29.423] Persisted trie from memory database      nodes=357 size=50.70KiB time="544.542µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [02-28|21:12:29.423] Successfully wrote genesis state         database=lightchaindata hash=11dc1e..783e6e
```

## boot node

there is currently no connection between node0 to node1

`bootnode -genkey boot.key`

`bootnode -nodekey boot.key`

```zsh
enode://78b7f2af438f26772fd34a7c520ae0cb045d4545f9c64a3f1cb46ed5977b0b2510c390146af316b56e86e8223a936a98827e6ca783f3c5e022e6fb427247a3c5@127.0.0.1:0?discport=30301
Note: you're using cmd/bootnode, a developer tool.
We recommend using a regular node as bootstrap node for production deployments.
INFO [02-28|21:14:28.086] New local node record                    seq=1,677,640,468,086 id=5f25d5bb97613cbf ip=<nil> udp=0 tcp=0
```

this node will discover the peers in the network

`geth --chainID 8063999 --datadir "./data" --bootnode` 
`geth --chainId 3168063999 --datadir "./data" --bootnode

enode://396de4e86a44325d901880408897b13425254f2e3382b780220bc9a09f0a5ff2de2623c09592889f9b3da97f1374838f33ff80bc12409543b656c2f4df7e3851@127.0.0.1:0?discport=30301

--port 30303 -ipcdisable --syncmode full -rpc --allow-insecure-unlock

./geth --datadir node1 --port 30306 --bootnodes enode://f7aba85ba369923bffd3438b4c8fde6b1f02b1c23ea0aac825ed7eac38e6230e5cadcf868e73b0e28710f4c9f685ca71a86a4911461637ae9ab2bd852939b77f@127.0.0.1:0?discport=30305  --networkid 123454321 --unlock 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b --password node1/password.txt`
