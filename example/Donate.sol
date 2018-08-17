pragma solidity ^0.4.24;
import "github.com/8kb/DryMoney/balance/WithdrawByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/Limit.sol";

/**
 * @title Demo donate contract
 */
contract Donate is BalanceWithdrawByOwnerLimited, BalanceLimit
{
    /**
     * @dev constructor
     */
    constructor() public {
        ownerLimitMaximum = 1 ether;
        ownerLimitSpeed = uint256(1 ether) / uint256(1 weeks);
    }
    
    /**
     * @dev Maximum limit balance
     */
    function() public payable balanceMaximum(26 ether) {}
}
