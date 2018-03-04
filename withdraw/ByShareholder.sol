pragma solidity ^0.4.18;
import "../share/IShared.sol";

contract WithdrawByShareholder is ShareIShared {
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
