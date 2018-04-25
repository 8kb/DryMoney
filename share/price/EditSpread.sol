pragma solidity ^0.4.21;

contract EditSpread {
    function setSpread(uint _spread)  onlyOwner public {
        spread = _spread;
    }
    function setSpreadUnits(uint _spreadUnits)  onlyOwner public {
        spreadUnits = _spreadUnits;
    }
}