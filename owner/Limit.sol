pragma solidity ^0.4.18;

contract OwnerLimit {
    uint256 oldOwnerLimit;
    uint oldOwnerLimitTimestamp = now;
    uint256 public ownerLimitSpeed;
    uint256 public ownerLimitMaximum;

    /**
     * @dev Get withdraw limit allowed for owner
     * @return An uint256 representing withdraw limit
     */
    function getOwnerLimit() public view returns (uint256) {
        if(oldOwnerLimit > ownerLimitMaximum) return oldOwnerLimit;
        uint256 period = now - oldOwnerLimitTimestamp;
        uint256 limit = oldOwnerLimit + (period * ownerLimitSpeed);
        if(limit > ownerLimitMaximum) limit = ownerLimitMaximum;
        return limit;
    }
    
    /**
     * @dev Change limit after withdraw
     * @param _value The amount to be changed
     */
    function changeOwnerLimit(uint256 _value) internal {
        oldOwnerLimit = getOwnerLimit() - _value;
        oldOwnerLimitTimestamp = now;
    }
}
