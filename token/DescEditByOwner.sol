pragma solidity ^0.4.18;
import "./Minimal.sol";
import "../owner/Owned.sol";

/**
 * @title 
 * @dev 
 */
contract TokenDescEditByOwner is TokenMinimal, OwnerOwned {
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
