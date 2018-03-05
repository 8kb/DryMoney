pragma solidity ^0.4.18;

contract BalanceRefillLimited {
    modifier refillLimit(uint256 _limit) {
        require(this.balance <= _limit);
        _;
    }
}
