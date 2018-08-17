pragma solidity ^0.4.24;
import "github.com/8kb/DryMoney/token/Editable.sol";
import "github.com/8kb/DryMoney/share/mint/ByOwner.sol";
import "github.com/8kb/DryMoney/balance/WithdrawByOwner.sol";
import "github.com/8kb/DryMoney/balance/WithdrawTokenByOwner.sol";

/**
 * @title Token where owner is king and god
 */
contract KingToken is
    TokenEditable,
    ShareMintByOwner,
    BalanceWithdrawByOwner,
    BalanceWithdrawTokenByOwner
{
    constructor() public {
        name = "Demo Token";
        symbol = "TKN";
        decimals = 18;
    }
}
