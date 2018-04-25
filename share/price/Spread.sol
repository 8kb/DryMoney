pragma solidity ^0.4.21;
import "../../lib/SafeMath.sol";
import "./Fixed.sol";

/**
 * @title 
 */
contract SharePriceSpread is SharePriceFixed {
    using LibSafeMath for uint256;
    
    uint256 public spreadUnits = 100000;
    uint256 public spread;
    
    function shareToWei(uint256 shareCount) public view returns (uint256) {
        uint256 amountWei = super.shareToWei(shareCount);
        uint256 spreadWei = amountWei.mulDiv(spread, spreadUnits);
        return amountWei.sub(spreadWei);
    }
}
