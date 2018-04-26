pragma solidity ^0.4.21;
import "github.com/8kb/DryMoney/token/Erc20.sol";
import "github.com/8kb/DryMoney/token/EditableByOwner.sol";

import "github.com/8kb/DryMoney/share/MaximumLimit.sol";
import "github.com/8kb/DryMoney/share/price/EditableSpread.sol";
import "github.com/8kb/DryMoney/share/buy/Directly.sol";
import "github.com/8kb/DryMoney/share/sell/Directly.sol";

import "github.com/8kb/DryMoney/share/mint/ByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/WithdrawTokenByOwner.sol";

/**
 * @title All functions token
 */
contract DemoToken is
    TokenErc20,
    TokenEditable,
    ShareMaximumLimit,
    SharePriceEditableSpread,
    ShareBuyDirectly,
    ShareMintByOwnerLimited,
    ShareSellDirectly,
    BalanceWithdrawByOwnerLimited,
    BalanceWithdrawTokenByOwner
{
    /**
     * @dev Constructor
     */
    function DemoToken() public {
        name = "Demo Token";
        symbol = "TKN";
        decimals = 6;
        //
        priceUnits = 1 ether;
        price = 2 * priceUnits;
        buyAllowed = true;
        mintingAllowed = true;
        shareMaximumLimit = 1000000000;
        //
        ownerLimitMaximum = 10 ether;
        ownerLimitSpeed = uint256(1 ether) / uint256(1 days);
        oldOwnerLimit = ownerLimitMaximum;
    }
}
