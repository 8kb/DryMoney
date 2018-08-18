pragma solidity ^0.4.24;
import "./Shared.sol";
import "../owner/Owned.sol";

contract ShareHold is OwnerOwned, ShareShared {
    mapping(address => bool) public holded;
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        require(!holded[_from]);
        return super.shareTransfer(_from, _to, _value);
    }
    
    function hold(address _user) onlyOwner public {
        holded[_user] = true;
    }
    
    function unhold(address _user) onlyOwner public {
        holded[_user] = false;
    }
}
