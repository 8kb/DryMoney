pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../lib/SafeMath.sol";

/**
 * @title Withdraw share
 */
contract ShareSellDirectly is ShareShared {
    using LibSafeMath for uint256;

    /**
     * @dev Withdraw all shared balance by shareholder 
     */
    function withdrawShare() public returns (bool) {
        require(shareCount() != 0);
//        uint256 balansedShare = shareSize(msg.sender).mul(address(this).balance); 
//        uint256 amount =  balansedShare.div(shareCount());
        uint256 senderShare = shareSize(msg.sender); 
        uint256 amount = senderShare.mulDiv(address(this).balance, shareCount());

        require(amount != 0);
        shareTransfer(msg.sender, 0, shareSize(msg.sender));
        msg.sender.transfer(amount);
        return true;
    }
}
