pragma solidity ^0.4.21;

/**
 * @title 
 * @dev 
 */
contract VotingVoting is OwnerOwned {
    mapping(address => bool) public approves;
    mapping(address => bool) public disapproves;
    uint public finishBlockNumber;
    bool internal finishedByOwner;

    function Voting(uint _finishBlockNumber) public {
        finishBlockNumber = _finishBlockNumber;
    }

    function finish() onlyOwner public {
        finishedByMaster = true;
    }

    function isFinished() public view {
        if(finishedByMaster) return true;
        if(block.number >= finishBlockNumber) return true;
        return false;
    }

    function approve() public {
        require(!isFinished());
        approves[msg.sender] = true;
        disapproves[msg.sender] = false;
    }

    function disapprove() public {
        require(!isFinished());
        approves[msg.sender] = false;
        disapproves[msg.sender] = true;
    }

    function cancelVote() public {
        require(!isFinished());
        approves[msg.sender] = false;
        disapproves[msg.sender] = false;
    }
}
