pragma solidity ^0.4.21;

/**
 * @title Price functions
 */
contract ProtoPriced {
    /**
     * @dev Calculate default price for selected number of shares
     * @param shareCount number of shares
     * @return default amount
     */
    function shareToWei(uint256 shareCount) public view returns (uint256);

    /**
     * @dev Calculate count of shares what can buy with selected amount for default price
     * @param amountWei 
     * @return number of shares
     */
    function weiToShare(uint256 amountWei) public view returns (uint256);
}
