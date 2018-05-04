pragma solidity ^0.4.23;
import "../Shared.sol";
import "../../proto/Priced.sol";

/**
 * @title Buy share
 */
contract ShareBuyDirectly is ShareShared, ProtoPriced {
    bool public buyAllowed;

    function() public payable {
        if(gasleft() >= 80000) {
            buy();
        } else {
            revert();
        }
    }

    function buy() public payable {
        require(buyAllowed);
        uint256 shareNumber = weiToShare(msg.value);
        shareTransfer(0, msg.sender, shareNumber);
    }
}
