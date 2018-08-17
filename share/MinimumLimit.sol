pragma solidity ^0.4.24;
import "./Shared.sol";
import "../lib/SafeMath.sol";

/**
 * @title 
 */
contract ShareMinimumLimit is ShareShared {
    using LibSafeMath for uint256;
    
    uint256 public shareMinimumLimit;
    
    /**
     * @dev Internal transfer tokens from one address to another
     * @dev if adress is zero - mint or destroy tokens
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_from == address(0)) {
            require(shareCount().add(_value) >= shareMinimumLimit);
        }
        return super.shareTransfer(_from, _to, _value);
    }
}
