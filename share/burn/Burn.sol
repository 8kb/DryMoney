pragma solidity ^0.4.21;
import "../Shared.sol";

/**
 * @title Burn
 */
contract ShareBurnBurn is ShareShared {
    event Burn(address indexed owner, uint256 amount);
    
    /**
     * @dev Burn share
     * @param _value The amount to be burn
     */
    function burn(uint256 _value) public returns (bool) {
        require(_value != 0);
        emit Burn(msg.sender, _value);
        return shareTransfer(msg.sender, 0, _value);
    }
}
