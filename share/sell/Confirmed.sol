pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../owner/Owned.sol";
import "../../proto/Priced.sol";

contract ShareSellConfirmed is ShareShared, OwnerOwned, ProtoPriced {
    bool public sellAllowed;
    SellOrder[] internal sellOrder;
    uint256 public sellOrderTotal;
    struct SellOrder {
        address user; 
        uint256 shareNumber;
    }
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_to == address(this)) {
            require(buyAllowed);
            sellOrder.push(SellOrder(msg.sender, _value));
            sellOrderTotal += _value;
        }
        return super.shareTransfer(_from, _to, _value);
    }
    
    function confirmAllSells() external onlyOwner {
        while(sellOrder.length > 0) {
            confirmOneSell(sellOrder.length-1);
            delete sellOrder[sellOrder.length-1];
            sellOrder.length--;
        }
    }
    
    function confirmOneSell(uint256 i) internal {
        uint256 shareNumber = sellOrder[i].shareNumber;
        uint256 amountWei = shareToWei(shareNumber);
        address user = sellOrder[i].user;
        shareTransfer(address(this), address(0), shareNumber);
        user.transfer(amountWei);
        sellOrderTotal -= shareNumber;
    }
}