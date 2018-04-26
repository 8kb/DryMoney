pragma solidity ^0.4.23;
import "../Shared.sol";
import "../../proto/Priced.sol";

/**
 * @title Buy share
 */
contract ShareBuyDirectly is ShareShared, ProtoPriced {
    bool public buyAllowed;


    function() public payable {
        require(buyAllowed);
        uint256 shareNumber = weiToShare(msg.value);
        return shareTransfer(0, msg.sender, shareNumber);
    }
}
