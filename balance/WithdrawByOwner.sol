pragma solidity ^0.4.21;
import "../owner/Owned.sol";

/**
 * @title Withdraw by owner
 */
contract BalanceWithdrawByOwner is OwnerOwned {
    /**
     * @dev Withdraw ethereum for a specified address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     */
    function withdraw(address _to, uint256 _value) onlyOwner public returns (bool) {
        require(_to != address(0));
        require(_value <= address(this).balance);
        _to.transfer(_value);
        return true;
    }
}
