pragma solidity ^0.4.18;
import "github.com/8kb/DryMoney/balance/WithdrawByOwnerLimited.sol";
import "github.com/8kb/DryMoney/balance/RefillLimited.sol";

contract Donate is BalanceWithdrawByOwnerLimited, BalanceRefillLimited
{
    function Donate() public {
        ownerLimitMaximum = 1 ether;
        ownerLimitSpeed = uint256(1 ether) / uint256(1 weeks);
    }
    
    function() public payable refillLimit(26 ether) {}
}
