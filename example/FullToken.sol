pragma solidity ^0.4.18;
import "github.com/8kb/DryMoney/DryContract.sol";
import "github.com/8kb/DryMoney/share/SharedLite.sol";
import "github.com/8kb/DryMoney/token/Minimal.sol";
import "github.com/8kb/DryMoney/token/DescEditByOwner.sol";
import "github.com/8kb/DryMoney/token/Allowance.sol";
import "github.com/8kb/DryMoney/share/Burn.sol";
import "github.com/8kb/DryMoney/share/buy/Buyable.sol";
import "github.com/8kb/DryMoney/share/buy/WithdrawSecurity.sol";
import "github.com/8kb/DryMoney/share/mint/ByOwnerLimited.sol";
import "github.com/8kb/DryMoney/withdraw/ByOwnerLimited.sol";
import "github.com/8kb/DryMoney/withdraw/ByShareholder.sol";
import "github.com/8kb/DryMoney/share/CountLimit.sol";

contract DemoToken is DryContract
ShareSharedLite,
TokenMinimal,
TokenDescEditByOwner,
TokenAllowance,
ShareBurn,
ShareBuyBuyable,
ShareBuyWithdrawSecurity,
ShareCountLimit,
ShareMintByOwnerLimited,
WithdrawByOwnerLimited,
WithdrawByShareholder
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
