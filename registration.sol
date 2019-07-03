contract Registration {

    bool public unlocked = false;  

    struct Participant { 
        bytes32 name;
        address mappedAddress;
    }

    mapping(address => Participant) public registeredParticipant; 

    function register(bytes32 _name, address _mappedAddress) public {
        Participant participant;
        participant.name = _name;
        participant.mappedAddress = _mappedAddress;

        registeredParticipant[msg.sender] = participant;

        require(unlocked); 
    }

    function () payable{}
    
    function withdraw(){
        require(unlocked);
        msg.sender.transfer(this.balance);
    }

    function lock(){
        unlocked = false;
    }
}