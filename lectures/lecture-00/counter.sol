// SPDX-License

pragma solidity ^0.8.13;

contract Counter {
    // default to private, initialized to zero
    uint256 public count;

    // function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // function to increment count by 1
    function inc() public {
        count += 1;
    }

    // function to decrement count by 1
    function dec() public {
        count -= 1;
    }
}

/*
the amount of opt codes 
application binary interface
ABI

Gnache
go lang intrepretation 
brew install ganache
projects 
SmartCon 2022 September 

*/
