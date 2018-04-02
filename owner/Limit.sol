pragma solidity ^0.4.21;
import "../lib/SafeMath.sol";

/**
 * @title Owner limit
 */
contract OwnerLimit {
    using LibSafeMath for uint256;
    
    uint256 oldOwnerLimit;
    uint oldOwnerLimitTimestamp = now;
    uint256 public ownerLimitSpeed;
    uint256 public ownerLimitMaximum;

    /**
     * @dev Get withdraw/operation limit allowed for owner
     * @return An uint256 representing withdraw limit
     */
    function getOwnerLimit() public view returns (uint256) {
        if(oldOwnerLimit > ownerLimitMaximum) return oldOwnerLimit;
        uint256 period = now.sub(oldOwnerLimitTimestamp);
        uint256 delta = period.mul(ownerLimitSpeed);
        uint256 limit = oldOwnerLimit.add(delta);
        if(limit > ownerLimitMaximum) limit = ownerLimitMaximum;
        return limit;
    }
    
    /**
     * @dev Change limit after withdraw
     * @param _value The amount to be changed
     */
    function changeOwnerLimit(uint256 _value) internal {
        oldOwnerLimit = getOwnerLimit().sub(_value);
        oldOwnerLimitTimestamp = now;
    }
}
