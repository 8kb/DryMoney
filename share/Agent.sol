pragma solidity ^0.4.18;
import "../share/IShared.sol";
import "../owner/Owned.sol";

contract ShareAgent is OwnerOwned, ShareIShared {
    mapping(address => Trust) private trusted;
    struct Trust {
        uint256 size;
        address agent; 
    }

    function haveAgent(address _owner) private view returns (bool) {
        return trusted[_owner].agent != address(0);
    }
    
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        while(haveAgent(_from)) {
            trusted[_from].size -= _value;
            _from = trusted[_from].agent;
        }
        while(haveAgent(_to)) {
            trusted[_to].size += _value;
            _to = trusted[_to].agent;
        }
        return super.shareTransfer(_from, _to, _value);
    }
    
    function empowerAgent(address newAgent) public returns (bool) {
        require(newAgent != address(0));
        if(!haveAgent(msg.sender)) {
            trusted[msg.sender].size = shareSize(msg.sender);
        }
        shareTransfer(msg.sender, newAgent, trusted[msg.sender].size);
        trusted[msg.sender].agent = newAgent;
        return true;
    }

    function fireAgent() public returns (bool) {
        require(haveAgent(msg.sender));
        address oldAgent = trusted[msg.sender].agent;
        trusted[msg.sender].agent = address(0);
        shareTransfer(oldAgent, msg.sender, trusted[msg.sender].size);
        trusted[msg.sender].size = 0;
        return true;
    }
    
    function transferByOwner(address _from, address _to, uint256 _value) onlyOwner public returns (bool) {
        return shareTransfer(_from, _to, _value);
    }
}
