pragma solidity ^0.4.21;
import "./DepositProxy.sol";
import "github.com/8kb/DryMoney/excange/Accounts.sol";

/**
 * @title 
 * @dev 
 */
contract ProxyFactory is ExchangeAccounts {
    mapping(address => address) private depositProxys;

    function createDepositAddress() public {
        require(proxys[msg.sender] == address(0));
        depositProxys[msg.sender] = new DepositProxy(msg.sender);
    }
    
    function getDepositAddress() public returns(address) {
        require(proxys[msg.sender] == address(0));
        return depositProxys[msg.sender];
    }
    
    function depositTo() payable public {
        
    }    
    
    function depositTokenTo() public {
        
    }
}

import "github.com/8kb/DryMoney/token/IErc20Basic.sol";

/**
 * @title 
 * @dev 
 */
contract DepositProxy {
//    address internal owner;
//    address internal target;
    address public owner;
    address public target;
    function DepositProxy(address _owner) {
        owner = _owner;
        target = msg.sender;
    }
    
    function() public payable {
        ProxyFactory(target).depositTo.value(this.balance)(owner);
    }
    
    function transferToken(address _token) public returns (bool) {
        token = TokenIErc20Basic(_token);
        uint256 value = token.balanceOf(this);
        require(token.transfer(target, value));
        require(ProxyFactory(target).depositTokenTo.(owner, value));
        return true;
    }
}
