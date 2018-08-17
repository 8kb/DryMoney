pragma solidity ^0.4.24;
import "../../owner/Owned.sol";
import "./EditablePrice.sol";
import "./Comission.sol";

contract SharePriceEditableComission is OwnerOwned, SharePriceComission, SharePriceEditablePrice  {

    function setSellComission(uint _sellComission) onlyOwner public {
        sellComission = _sellComission;
    }
    function setSellComissionUnits(uint _sellComissionUnits) onlyOwner public {
        sellComissionUnits = _sellComissionUnits;
    }

    function setBuyComission(uint _buyComission) onlyOwner public {
        buyComission = _buyComission;
    }
    function setBuyComissionUnits(uint _buyComissionUnits) onlyOwner public {
        buyComissionUnits = _buyComissionUnits;
    }
}