pragma solidity ^0.4.21;
import "./Erc20Basic.sol";
import "../owner/Owned.sol";

/**
 * @title 
 */
contract TokenEditableByOwner is TokenErc20Basic, OwnerOwned {
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
