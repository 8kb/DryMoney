pragma solidity ^0.4.24;

/**
 * @title Price functions
 */
contract ProtoPriced {
    /**
     * @dev Calculate default price for selected number of shares
     * @param shareNumber number of shares
     * @return default amount
     */
    function shareToWei(uint256 shareNumber) public view returns (uint256);

    /**
     * @dev Calculate count of shares what can buy with selected amount for default price
     * @param amountWei amount for buy shre
     * @return number of shares
     */
    function weiToShare(uint256 amountWei) public view returns (uint256);
}
