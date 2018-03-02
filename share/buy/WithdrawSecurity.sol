pragma solidity ^0.4.18;
import "./Buyable.sol";

contract ShareBuyWithdrawSecurity is ShareBuyBuyable {
    /**
     * @dev Calculate count of shares what can buy concret buyer with selected amount
     * @param amount 
     * @return number of shares
     */
    function buyShareNumber(uint256 amount) public view returns (uint256) {
        uint256 number = super.buyShareNumber(amount);
        uint256 withdrawLimit = number * this.balance / (shareCount() + number);
        require(amount >= withdrawLimit);
        return number;
    }
}