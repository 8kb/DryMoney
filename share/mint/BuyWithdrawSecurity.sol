pragma solidity ^0.4.18;
import "./Buy.sol";
import "../../lib/SafeMath.sol";

contract ShareMintBuyWithdrawSecurity is ShareMintBuy {
    using LibSafeMath for uint256;
    /**
     * @dev Calculate count of shares what can buy concret buyer with selected amount
     * @param amount 
     * @return number of shares
     */
    function buyShareNumber(uint256 amount) public view returns (uint256) {
        uint256 number = super.buyShareNumber(amount);
        uint256 balancedNumber = number.mul(this.balance);
        uint256 newShareCount = shareCount().add(number);
        uint256 withdrawLimit = balancedNumber.div(newShareCount);
        require(amount >= withdrawLimit);
        return number;
    }
}
