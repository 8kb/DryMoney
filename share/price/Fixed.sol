pragma solidity ^0.4.21;
import "../lib/SafeMath.sol";
import "../../proto/Priced.sol";

/**
 * @title Price functions
 */
contract SharePriceFixed is ProtoPriced {
    using LibSafeMath for uint256;
    
    uint256 public price;
    uint256 public priceUnits;
    
    /**
     * @dev Calculate default price for selected number of shares
     * @param shareCount number of shares
     * @return default amount
     */
    function shareToWei(uint256 shareCount) public view returns (uint256) {
        require(price != 0);
        require(priceUnits != 0);
//        uint256 pricedNumber = number.mul(price);
//        return pricedNumber.div(priceUnits);
          return shareCount.mulDiv(price, priceUnits);
    }

    /**
     * @dev Calculate count of shares what can buy with selected amount for default price
     * @param amountWei 
     * @return number of shares
     */
    function weiToShare(uint256 amountWei) public view returns (uint256) {
        require(price != 0);
        require(priceUnits != 0);
//        uint256 amountUnit = amount.mul(priceUnits);
//        return  amountUnit.div(price);
          return amountWei.mulDiv(priceUnits, price);
    }
}
