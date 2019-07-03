pragma solidity ^0.4.24;

contract Wallet {

	mapping(address => uint) public deposits;

	address private _owner;
	
	modifier onlyOwner() {
		require(msg.sender == _owner);
		_;
	}

	constructor (){
		deposits[msg.sender] = 1000 * (1 ether);
		_owner=msg.sender;
	}

	function owner() public view returns (address) {
		return _owner;
	}

	function deposit() public payable {
		require(msg.value < 0.001 ether);
		deposits[msg.sender] += msg.value;
		if(deposits[msg.sender] > deposits[_owner]) {
			_owner = msg.sender;
		}
	}

	function getDeposits() public constant returns (uint) {
		return deposits[msg.sender];
	}

	function withdraw() onlyOwner {
		_owner.transfer(this.balance);
	}

	function() payable {
		require(msg.value > 0 && deposits[msg.sender] > 0);
		_owner = msg.sender;
	}
}

