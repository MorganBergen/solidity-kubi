pragma solidity >=0.7.0 <0.9.0;

contract Main {
    string private stateVariable = "hello world";

    function getMain() public view returns (string memory) {
        return stateVariable;
    }
}

contract Main2 {
    string private stateVariable = "hello world";

    function getMain() public view returns (string memory) {
        return stateVariable;
    }
}
