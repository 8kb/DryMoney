pragma solidity ^0.4.21;
import "github.com/8kb/DryMoney/token/Erc20.sol";
import "github.com/8kb/DryMoney/token/DescEditByOwner.sol";
import "github.com/8kb/DryMoney/share/MaximumLimit.sol";
import "github.com/8kb/DryMoney/share/mint/Buy.sol";
import "github.com/8kb/DryMoney/share/mint/BuyWithdrawSecurity.sol";
import "github.com/8kb/DryMoney/share/mint/ByOwnerLimited.sol";
import "github.com/8kb/DryMoney/share/burn/Burn.sol";
import "github.com/8kb/DryMoney/share/burn/BalancePricedSell.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwnerLimited.sol";

/**
 * @title All functions token
 */
contract DemoToken is
    TokenErc20,
    TokenDescEditByOwner,
    ShareMaximumLimit,
    ShareMintBuy,
    ShareMintBuyWithdrawSecurity,
    ShareMintByOwnerLimited,
    ShareBurnBurn,
    ShareBurnBalancePricedSell,
    BalanceWithdrawByOwnerLimited
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
