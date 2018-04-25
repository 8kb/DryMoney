pragma solidity ^0.4.21;
import "../../owner/Owned.sol";

contract EditSpread is OwnerOwned {
    function setSpread(uint _spread) onlyOwner public {
        spread = _spread;
    }
    function setSpreadUnits(uint _spreadUnits) onlyOwner public {
        spreadUnits = _spreadUnits;
    }
}