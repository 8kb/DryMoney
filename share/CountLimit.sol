pragma solidity ^0.4.18;
import "../share/IShared.sol";

contract ShareCountLimit is ShareIShared {
    uint256 public maximumShareCount;
    
    /**
     * @dev Internal transfer tokens from one address to another
     * @dev if adress is zero - mint or destroy tokens
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_from == address(0)) {
            require(shareCount() + _value <= maximumShareCount);
        }
        return super.shareTransfer(_from, _to, _value);
    }
}
