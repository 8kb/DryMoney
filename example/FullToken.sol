pragma solidity ^0.4.18;
import "github.com/8kb/DryMoney/share/SharedLite.sol";
import "github.com/8kb/DryMoney/token/Minimal.sol";
import "github.com/8kb/DryMoney/token/DescEditByOwner.sol";
import "github.com/8kb/DryMoney/token/Allowance.sol";
import "github.com/8kb/DryMoney/share/Burn.sol";
import "github.com/8kb/DryMoney/share/buy/Buyable.sol";
import "github.com/8kb/DryMoney/share/buy/WithdrawSecurity.sol";
import "github.com/8kb/DryMoney/share/mint/ByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByShareholder.sol";
import "github.com/8kb/DryMoney/share/CountLimit.sol";

contract DemoToken is
ShareSharedLite,
TokenMinimal,
TokenDescEditByOwner,
TokenAllowance,
ShareBurn,
ShareBuyBuyable,
ShareBuyWithdrawSecurity,
ShareCountLimit,
ShareMintByOwnerLimited,
BalanceWithdrawByOwnerLimited,
BalanceWithdrawByShareholder
{
    function DemoToken() public {
        name = "Demo Token";
        symbol = "TKN";
        decimals = 6;
        //
        priceUnits = 1 ether;
        price = 2 * priceUnits;
        buyAllowed = true;
        mintingAllowed = true;
        maximumShareCount = 1000000000;
        //
        ownerLimitMaximum = 10 ether;
        ownerLimitSpeed = uint256(1 ether) / uint256(1 days);
        oldOwnerLimit = ownerLimitMaximum;
    }
}
