pragma solidity ^0.4.21;

/**
 * @title 
 */
 contract ShareIShared {
    /**
     * @dev total number of shares in existence
     */
    function shareCount() internal view returns (uint256);

    /**
     * @dev Gets the balance of the specified address
     * @param _owner The address to query the the balance of
     * @return An uint256 representing the amount owned by the passed address
     */
    function shareSize(address _owner) internal view returns (uint256 balance);

    /**
     * @dev Internal transfer tokens from one address to another
     * @dev if adress is zero - mint or destroy tokens
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool);
}
