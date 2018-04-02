pragma solidity ^0.4.21;
import "./Buy.sol";
import "../../lib/SafeMath.sol";

/**
 * @title Prevents the purchase of tokens at a price lower than the value of assets
 */
contract ShareMintBuyWithdrawSecurity is ShareMintBuy {
    using LibSafeMath for uint256;

    /**
     * @dev Calculate count of shares what can buy concret buyer with selected amount
     * @param amount 
     * @return number of shares
     */
    function buyShareNumber(uint256 amount) public view returns (uint256) {
        uint256 number = super.buyShareNumber(amount);
        uint256 balancedNumber = number.mul(address(this).balance);
        uint256 newShareCount = shareCount().add(number);
        uint256 withdrawLimit = balancedNumber.div(newShareCount);
        require(amount >= withdrawLimit);
        return number;
    }
}
