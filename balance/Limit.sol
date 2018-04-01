pragma solidity ^0.4.21;

contract BalanceLimit {
    modifier balanceMaximum(uint256 _limit) {
        require(this.balance <= _limit);
        _;
    }
    modifier balanceMinimum(uint256 _limit) {
        require(this.balance >= _limit);
        _;
    }
}
