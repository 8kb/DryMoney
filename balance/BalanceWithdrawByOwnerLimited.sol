pragma solidity ^0.4.18;
import "./WithdrawByOwner.sol";
import "../owner/Limit.sol";

contract BalanceWithdrawByOwnerLimited is BalanceWithdrawByOwner, OwnerLimit {
    /**
     * @dev Withdraw ethereum for a specified address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     */
    function withdraw(address _to, uint256 _value) onlyOwner public returns (bool) {
        uint256 limit = getOwnerLimit();
        require(_value <= limit);
        changeOwnerLimit(_value);
        return super.withdraw(_to, _value);
    }
}
