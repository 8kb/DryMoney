pragma solidity ^0.4.18;
import "../share/IShared.sol";
import "../lib/SafeMath.sol";

contract BalanceWithdrawByShareholder is ShareIShared {
    using LibSafeMath for uint256;
    /**
     * @dev Withdraw all shared balance by shareholder 
     */
    function withdrawShare() public returns (bool) {
        require(shareCount() != 0);
        uint256 balansedShare = shareSize(msg.sender).mul(this.balance); 
        uint256 amount =  balansedShare.div(shareCount());
        require(amount != 0);
        shareTransfer(msg.sender, 0, shareSize(msg.sender));
        msg.sender.transfer(amount);
        return true;
    }
}