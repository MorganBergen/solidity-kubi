pragma solidity >=0.7.0 <0.9.0;

contract Main {
    string private stateVariable = "hello world";

    function getMain() public view returns (string memory) {
        return stateVariable;
    }
}

/*
human node
github.com/sx328
*/
