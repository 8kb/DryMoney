pragma solidity ^0.4.21;
import "github.com/8kb/DryMoney/share/Shared.sol";
import "github.com/8kb/DryMoney/owner/Owned.sol";
import "github.com/8kb/DryMoney/share/Priced.sol";

contract ConfirmedBuys is ShareShared, OwnerOwned, SharePriced {
    BuyOrder[] internal buyOrder;
    uint256 public buyOrderTotal;
    struct BuyOrder {
        address user; 
        uint256 amountWei;
    }
    
    function() public payable {
        buyOrder.push(BuyOrder(msg.sender, msg.value));
        buyOrderTotal += msg.value;
    }
    
    function confirmAllBuys() external onlyOwner {
        while(buyOrder.length > 0) {
            confirmOneBuy(buyOrder.length-1);
            delete buyOrder[buyOrder.length-1];
            buyOrder.length--;
        }
    }
    
    function confirmOneBuy(uint256 i) internal {
        uint256 amountWei = buyOrder[i].amountWei;
        uint256 shareCount = defaultAmountToShare(amountWei);
        address user = buyOrder[i].user;
        shareTransfer(address(0), user, shareCount);
        buyOrderTotal -= amountWei;
    }
}