pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../proto/Priced.sol";

/**
 * @title Buy share
 */
contract ShareBuyDirectly is ShareShared, ProtoPriced {
    bool public buyAllowed;

    /**
     * @dev Calculate count of shares what can buy concret buyer with selected amount
     * @dev used for special price rules if any
     * @param amount 
     * @return number of shares
     */
    function buyShareNumber(uint256 amount) public view returns (uint256) {
        require(buyAllowed);
        require(amount != 0);
        return weiToShare(amount);
    }

    /**
     * @dev Buy tokens
     */
    function buy()  payable external returns (bool) {
        uint256 number = buyShareNumber(msg.value);
        return shareTransfer(0, msg.sender, number);
    }
}
