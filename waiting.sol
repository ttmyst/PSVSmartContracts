pragma solidity ^0.4.24;
contract Waiting {

    mapping(address => uint) public balances;
    mapping(address => uint64) public waitingTime;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        waitingTime[msg.sender] = uint64(now + 5 days);
    }

    function increaseWaitingTime(uint64 _seconds) public {
        waitingTime[msg.sender] += _seconds;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0);
        require(now > waitingTime[msg.sender]);
        msg.sender.transfer(this.balance);
    }
    
    function () payable{}
}