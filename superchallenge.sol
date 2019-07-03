pragma solidity ^0.4.24;

contract SuperChallenge {
    bytes32 answerHash = 0x846b7b6deb1cfa110d0ea7ec6162a7123b761785528db70cceed5143183b11fc;

    constructor() public payable {
        require(msg.value == 1 ether);
    }

    function guess(uint8 n) public payable {
        require(msg.value == 0.1 ether);

        if (keccak256(n) == answerHash) {
            msg.sender.transfer(1.1 ether);
        }
    }
    
    function() payable {}
}