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

### node1

**address**
**password**
**secret key file path**
/Users/owner/Documents/GitHub/solidity-kubi/lectures/network

### node2

**address** 0x0768ab569F4EFD35CbB39f3C58f921b9A1A7A1Fd
**password** password
**secret key file path**
/Users/owner/Documents/GitHub/solidity-kubi/lectures/network
/node2/keystore/UTC--2022-08-15T18-06-59.657684000Z--0768ab569f4efd35cbb39f3c58f921b9a1a7a1fd
