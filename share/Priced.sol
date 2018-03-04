pragma solidity ^0.4.18;
import "../DryContract.sol";

contract SharePriced is DryContract{
    uint256 public price;
    uint256 public priceUnits;
    
    /**
     * @dev Calculate default price for selected number of shares
     * @param number number of shares
     * @return default amount
     */
    function defaultShareToAmount(uint256 number) public view returns (uint256) {
        require(price != 0);
        require(priceUnits != 0);
        uint256 pricedNumber = number.mul(price);
        return pricedNumber.div(priceUnits);
    }

    /**
     * @dev Calculate count of shares what can buy with selected amount for default price
     * @param amount 
     * @return number of shares
     */
    function defaultAmountToShare(uint256 amount) public view returns (uint256) {
        require(price != 0);
        require(priceUnits != 0);
        uint256 amountUnit = amount.mul(priceUnits);
        return  amountUnit.div(price);
    }
}
