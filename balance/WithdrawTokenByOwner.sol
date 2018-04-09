pragma solidity ^0.4.21;
import "../owner/Owned.sol";
import "../token/IErc20.sol";

/**
 * @title Withdraw token by owner
 */
contract BalanceWithdrawTokenByOwner is OwnerOwned {
    /**
     * @dev Withdraw token (assets of our contract) for a specified address
     * @param token The address of token for transfer
     * @param _to The address to transfer to
     * @param amount The amount to be transferred
     */
    function withdrawToken(address token, address _to, uint256 amount) onlyOwner public returns (bool) {
        require(token != address(0));
        require(TokenIErc20(token).balanceOf(address(this)) >= amount);
        bool transferOk = TokenIErc20(token).transfer(_to, amount);
        require(transferOk);
        return true;
    }
}
