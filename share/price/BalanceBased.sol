pragma solidity ^0.4.24;
import "../../lib/SafeMath.sol";

/**
 * @title 
 */
contract SharePriceBalanceBasedSell {
    using LibSafeMath for uint256;
    
    /**
     * @dev Calculate default price for selected number of shares
     * @param shareNumber number of shares
     * @return amount
     */
    function shareToWei(uint256 shareNumber) public view returns (uint256) {
        require(shareCount() != 0);
        return shareNumber.mulDiv(address(this).balance, shareCount());
    }
}
