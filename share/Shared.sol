pragma solidity ^0.4.24;
import "../lib/SafeMath.sol";

/**
 * @title 
 * @dev 
 */
 contract ShareShared {
    using LibSafeMath for uint256;
    event Burn(address indexed owner, uint256 amount);
    event Mint(address indexed to, uint256 amount);

    /**
     * @dev shares balances
     */
    mapping(address => uint256) private shares;

    /**
     * @dev  total number of tokens in existence
     */
    uint256 private shareCount_;

    /**
     * @dev total number of shares in existence
     */
    function shareCount() internal view returns (uint256) {
        return shareCount_;
    }

    /**
     * @dev Gets the balance of the specified address
     * @param _owner The address to query the the balance of
     * @return An uint256 representing the amount owned by the passed address
     */
    function shareSize(address _owner) internal view returns (uint256 balance) {
        return shares[_owner];
    }

    /**
     * @dev Internal transfer tokens from one address to another
     * @dev if adress is zero - mint or destroy tokens
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function shareTransfer(address _from, address _to, uint256 _value) internal returns (bool) {
        if(_from == address(0)) {
            emit Mint(_to, _value);
            shareCount_ =shareCount_.add(_value);
        } else {
            require(_value <= shares[_from]);
            shares[_from] = shares[_from].sub(_value);
        }
        if(_to == address(0)) {
            emit Burn(msg.sender, _value);
            shareCount_ =shareCount_.sub(_value);
        } else {
            shares[_to] =shares[_to].add(_value);
        }
        return true;
    }
}
