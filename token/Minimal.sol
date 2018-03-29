pragma solidity ^0.4.18;
import "../share/IShared.sol";
import "../token/IErc20Basic.sol";

/**
 * @title Minimal Token
 * @dev Minimal functions for ERC20, with no allowances
 */
contract TokenMinimal is ShareIShared, TokenIErc20Basic {
    string public name;
    string public symbol;
    uint8 public decimals;

    /**
     * @dev total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return shareCount();
    }

    /**
     * @dev Gets the balance of the specified address
     * @param _owner The address to query the the balance of
     * @return An uint256 representing the amount owned by the passed address
     */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return shareSize(_owner);
    }

    /**
     * @dev transfer token for a specified address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        return shareTransfer(msg.sender, _to, _value);
    }

    /**
     * @dev Internal transfer tokens from one address to another
     * @dev if adress is zero - mint or destroy tokens
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        super.shareTransfer(_from, _to, _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}
