pragma solidity ^0.4.21;
import "github.com/8kb/DryMoney/share/Shared.sol";
import "github.com/8kb/DryMoney/owner/Owned.sol";
import "github.com/8kb/DryMoney/share/Priced.sol";

contract ConfirmedSells is ShareShared, OwnerOwned, SharePriced {
    SellOrder[] internal sellOrder;
    uint256 public sellOrderTotal;
    struct SellOrder {
        address user; 
        uint256 shareCount;
    }
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_to == address(this)) {
            sellOrder.push(SellOrder(msg.sender, _value));
            sellOrderTotal += _value;
            _to = address(0);
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
        uint256 shareCount = sellOrder[i].shareCount;
        uint256 amountWei = defaultShareToAmount(shareCount);
        address user = sellOrder[i].user;
        shareTransfer(user, address(0), shareCount);
        user.transfer(amountWei);
        sellOrderTotal -= shareCount;
    }
}