pragma solidity >=0.4.21 <0.7.0;

contract Owner{
    address private owner;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }

    function changeOwner(address _newOwner) public isOwner {
        emit OwnerSet(owner, _newOwner);
        owner = _newOwner;
    }

    function getOwner() external view returns(address) {
        return owner;
    }
}