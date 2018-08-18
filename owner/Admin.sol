pragma solidity ^0.4.24;
import "Owned.sol";

contract OwnerAdmin is OwnerOwned {
    mapping(address => bool) public isAdmin;

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyAdmin() {
        require(isAdmin[msg.sender]);
        _;
    }
    
    function empowerAdmin(address _user) onlyOwner public {
        isAdmin[_user] = true;
    }

    function fireAdmin(address _user) onlyOwner public {
        holded[_user] = false;
    }
}
