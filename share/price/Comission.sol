pragma solidity ^0.4.24;
import "../../lib/SafeMath.sol";
import "./Fixed.sol";

/**
 * @title 
 */
contract SharePriceComission is SharePriceFixed {
    using LibSafeMath for uint256;
    
    uint256 public sellComissionUnits = 100000;
    uint256 public sellComission = 0;
    
    uint256 public buyComissionUnits = 100000;
    uint256 public buyComission = 0;
    
    function shareToWei(uint256 shareNumber) public view returns (uint256) {
        uint256 amountWei = super.shareToWei(shareNumber);
        uint256 comissionWei = amountWei.mulDiv(sellComission, sellComissionUnits);
        return amountWei.sub(comissionWei);
    }

    function weiToShare(uint256 amountWei) public view returns (uint256) {
        uint256 shareNumber = super.weiToShare(amountWei);
        uint256 comissionShare = shareNumber.mulDiv(buyComission, buyComissionUnits);
        return shareNumber.sub(comissionShare);
    }
}
