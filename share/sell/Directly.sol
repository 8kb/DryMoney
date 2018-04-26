pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../lib/SafeMath.sol";
import "../../proto/Priced.sol";

/**
 * @title Withdraw share
 */
contract ShareSellDirectly is ShareShared, ProtoPriced {
    using LibSafeMath for uint256;
    bool public sellAllowed;

    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_to == address(this)) {
            require(sellAllowed);
            _from.transfer(shareToWei(_value));
            _to = address(0);
        }
        return super.shareTransfer(_from, _to, _value);
    }
}
