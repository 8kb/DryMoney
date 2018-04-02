pragma solidity ^0.4.21;
import "../share/IShared.sol";
import "../lib/SafeMath.sol";

/**
 * @title Withdraw share
 */
contract BalanceWithdrawByShareholder is ShareIShared {
    using LibSafeMath for uint256;

    /**
     * @dev Withdraw all shared balance by shareholder 
     */
    function withdrawShare() public returns (bool) {
        require(shareCount() != 0);
//        uint256 balansedShare = shareSize(msg.sender).mul(address(this).balance); 
//        uint256 amount =  balansedShare.div(shareCount());
        uint256 shareSize = shareSize(msg.sender); 
        uint256 amount = address(this).balance.mulDiv(shareSize, shareCount());

        require(amount != 0);
        shareTransfer(msg.sender, 0, shareSize(msg.sender));
        msg.sender.transfer(amount);
        return true;
    }
}
