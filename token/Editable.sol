pragma solidity ^0.4.24;
import "./Erc20.sol";
import "../owner/Owned.sol";

/**
 * @title 
 */
contract TokenEditable is TokenErc20, OwnerOwned {
    function setName(string _name)  onlyOwner public {
        name = _name;
    }
    function setSymbol(string _symbol)  onlyOwner public {
        symbol = _symbol;
    }
    function setDecimals(uint8 _decimals)  onlyOwner public {
        decimals = _decimals;
    }
}
