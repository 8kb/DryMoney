pragma solidity ^0.4.21;
import "../lib/SafeMath.sol";
import "./Priced.sol";

/**
 * @title 
 */
contract ShareSpreadPriced is SharePriced {
    using LibSafeMath for uint256;
    
    uint256 public spreadUnits = 100000;
    uint256 public spread;
    
    function defaultShareToAmount(uint256 number) public view returns (uint256) {
        uint256 amount = super.defaultShareToAmount(number);
        uint256 spreadAmount = amount.mulDiv(spread, spreadUnits);
        return amount.sub(spreadAmount);
    }
}
