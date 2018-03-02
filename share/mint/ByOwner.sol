pragma solidity ^0.4.18;
import "../IShared.sol";
import "../../owner/Owned.sol";

contract ShareMintByOwner is ShareIShared, OwnerOwned {
    event Mint(address indexed to, uint256 amount);
    bool public mintingAllowed;
    
    /**
     * @dev Mint share and send for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be minted.
     */
    function mint(address _to, uint256 _value) onlyOwner public returns (bool) {
        require(mintingAllowed);
        require(_to != address(0));
        require(_value != 0);
        Mint(_to, _value);
        return shareTransfer(0, _to, _value);
    }
}