pragma solidity ^0.4.21;
import "../../owner/Owned.sol";
import "./Fixed.sol";

contract SharePriceEditablePrice is OwnerOwned, SharePriceFixed {
    function setPrice(uint256 _price) onlyOwner public {
        price = _price;
    }
    function setPriceUnits(uint256 _priceUnits) onlyOwner public {
        priceUnits = _priceUnits;
    }
}