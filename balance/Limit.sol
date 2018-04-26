pragma solidity ^0.4.23;

/**
 * @title Balance limit
 */
contract BalanceLimit {

    /**
     * @dev modifier limit maximum balance, used for payable functions
     * @param _limit maximum balance
     */
    modifier balanceMaximum(uint256 _limit) {
        require(address(this).balance <= _limit);
        _;
    }

    /**
     * @dev modifier limit minimum balance, used for withdraw functions
     * @param _limit minimum balance 
     */
    modifier balanceMinimum(uint256 _limit) {
        _;
        require(address(this).balance >= _limit);
    }
}
