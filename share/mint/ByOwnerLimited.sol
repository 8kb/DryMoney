pragma solidity ^0.4.23;
import "./ByOwner.sol";
import "../../proto/Priced.sol";
import "../../owner/Limit.sol";

/**
 * @title Mint by owner limited by owner limit
 */
contract ShareMintByOwnerLimited is ShareMintByOwner, ProtoPriced, OwnerLimit {
    /**
     * @dev Mint share and send for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be minted.
     */
    function mint(address _to, uint256 _value) onlyOwner public returns (bool) {
        uint256 amount = shareToWei(_value);
        require(amount <= getOwnerLimit());
        changeOwnerLimit(amount);
        return super.mint(_to, _value);
    }
}
