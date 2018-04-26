pragma solidity ^0.4.21;
import "../Shared.sol";
import "../../owner/Owned.sol";

/**
 * @title Mint by owner
 */
contract ShareMintByOwner is ShareShared, OwnerOwned {
    /**
     * @dev Mint share and send for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be minted.
     */
    function mint(address _to, uint256 _value) onlyOwner public returns (bool) {
        require(_to != address(0));
        return shareTransfer(0, _to, _value);
    }
}
