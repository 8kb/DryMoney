pragma solidity ^0.4.21;
import "../share/Shared.sol";
import "../lib/SafeMath.sol";

/**
 * @title 
 * @dev 
 */
contract VotingPower is ShareShared {
    using LibSafeMath for uint256;
   
    uint256 powerMinimum;
    address[] public poweredUsers;
    uint256 public poweredUsersCount;
    mapping(address => powersData) private powers;
    
    struct powersData {
         uint256 power;
         uint256 id;
    }
    
    function tryAdd(address user) private {
        if((powers[user].id == 0) && (powers[user].power >= powerMinimum)) {
            poweredUsers[poweredUsersCount] = user;
            poweredUsersCount++;
            powers[user].id = poweredUsersCount;
        }
    }
    
    function tryDelete(address user) private {
        if(powers[user].id > 0 && powers[user].power < powerMinimum) {
            uint256 userId = powers[user].id;
            powers[user].id = 0;
            poweredUsersCount--;
            address lastUserAddress = poweredUsers[poweredUsersCount];
            poweredUsers[userId - 1] = lastUserAddress;
            powers[lastUserAddress].id = userId - 1;
        }
    }
    
    function internalPower(address _user) internal returns(uint256) {
         return powers[_user].power;
    }
    
    function getPowerLevel(address _user) public returns(uint256) {
        uint256 userPower = internalPower(_user);
        if(userPower < powerMinimum) {
            return 0;
        } else {
            return userPower;
        }
    }

    function powerTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_from != address(0)) {
            require(_value <= powers[_from].power);
            powers[_from] = powers[_from].power.sub(_value);
        }
        if(_to != address(0)) {
            powers[_to] = powers[_to].power.add(_value);
        }
        return true;
    }

    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        require(super.shareTransfer(_from, _to, _value));
        return powerTransfer(_from, _to, _value);
    }
}
