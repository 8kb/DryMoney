pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../owner/Owned.sol";
import "../../proto/Priced.sol";

contract ConfirmedBuys is ShareShared, OwnerOwned, ProtoPriced {
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
        uint256 shareNumber = weiToShare(amountWei);
        address user = buyOrder[i].user;
        shareTransfer(address(0), user, shareNumber);
        buyOrderTotal -= amountWei;
    }
}