pragma solidity ^0.4.23;
import "github.com/8kb/DryMoney/token/Editable.sol";
import "github.com/8kb/DryMoney/share/price/EditableSpread.sol";
import "github.com/8kb/DryMoney/share/buy/Confirmed.sol";
import "github.com/8kb/DryMoney/share/sell/Confirmed.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwner.sol";
import "github.com/8kb/DryMoney/balance/WithdrawTokenByOwner.sol";

/**
 * @title Token with buy/sell need be confirmed by owner
 */
contract ConfirmedToken is
    TokenEditable,
    SharePriceEditableSpread,
    ShareBuyConfirmed,
    ShareSellConfirmed,
    BalanceWithdrawByOwner,
    BalanceWithdrawTokenByOwner
{
    constructor() public {
        name = "Demo Token";
        symbol = "TKN";
        decimals = 6;
        //
        priceUnits = 1 ether;
        price = 2 * priceUnits;
        buyAllowed = true;
        sellAllowed = true;
    }
}
