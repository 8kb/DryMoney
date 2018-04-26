pragma solidity ^0.4.21;
import "github.com/8kb/DryMoney/token/Editable.sol";
import "github.com/8kb/DryMoney/share/price/EditableSpread.sol";
import "github.com/8kb/DryMoney/share/buy/Confirmed.sol";
import "github.com/8kb/DryMoney/share/sell/Confirmed.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwner.sol";
import "github.com/8kb/DryMoney/balance/WithdrawTokenByOwner.sol";

/**
 * @title
 */
contract ConfirmedToken is
    TokenEditable,
    SharePriceEditableSpread,
    ShareBuyConfirmed,
    ShareSellConfirmed,
    BalanceWithdrawByOwner,
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
        sellAllowed = true;
    }
}
