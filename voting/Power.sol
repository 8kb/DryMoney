pragma solidity ^0.4.18;
import "../share/IShared.sol";
import "../lib/SafeMath.sol";

contract VotingPower is ShareIShared {
    using LibSafeMath for uint256;
   
    uint256 powerMinimum;
    address[] public poweredUsers;
    uint64 public poweredUsersCount;
    mapping(address => powersData) private powers;
    
    struct powersData {
         uint256 power;
         uint64 number;
    }
    
    function tryAdd(address user) private {
        if((powers[user].number == 0) && (powers[user].power >= powerMinimum)) {
            poweredUsers[poweredUsersCount] = user;
            poweredUsersCount++;
            powers[user].number = poweredUsersCount;
        }
    }
    
    function tryDelete(address user) private {
        if(powers[user].number > 0 && powers[user].power < powerMinimum) {
            uint64 userId = powers[user].number - 1;
            powers[user].number = 0;
            poweredUsersCount--;
            address lastUserAddress = poweredUsers[poweredUsersCount];
            poweredUsers[userId] = lastUserAddress;
            powers[lastUserAddress].number = userId;
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

