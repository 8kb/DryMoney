pragma solidity ^0.4.24;
import "../../owner/Owned.sol";
import "./EditablePrice.sol";
import "./Spread.sol";

contract SharePriceEditableSpread is OwnerOwned, SharePriceSpread, SharePriceEditablePrice  {
    function setSpread(uint _spread) onlyOwner public {
        spread = _spread;
    }
    function setSpreadUnits(uint _spreadUnits) onlyOwner public {
        spreadUnits = _spreadUnits;
    }
}