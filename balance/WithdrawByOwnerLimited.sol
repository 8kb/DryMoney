pragma solidity ^0.4.24;
import "./WithdrawByOwner.sol";
import "../owner/Limit.sol";

/**
 * @title Balance Withdraw by owner, limited by owner limit
 */
contract BalanceWithdrawByOwnerLimited is BalanceWithdrawByOwner, OwnerLimit {
    /**
     * @dev Withdraw ethereum for a specified address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     */
    function withdraw(address _to, uint256 _value) onlyOwner public returns (bool) {
        require(_value <= getOwnerLimit());
        changeOwnerLimit(_value);
        return super.withdraw(_to, _value);
    }
}
