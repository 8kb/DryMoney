pragma solidity ^0.4.18;

contract ExchangeAccounts {
  //mapping of token addresses to mapping of account balances (token=0 means Ether)
  mapping (address => mapping (address => uint)) public tokens;
  
  event Deposit(address token, address user, uint amount, uint balance);
  event Withdraw(address token, address user, uint amount, uint balance);

  function() {
    throw;
  }

  function deposit() payable {
    tokens[0][msg.sender] += msg.value;
    Deposit(0, msg.sender, msg.value, tokens[0][msg.sender]);
  }

  function withdraw(uint amount) {
    require(tokens[0][msg.sender] >= amount);
    tokens[0][msg.sender] -= amount;
    msg.sender.transfer(amount);
    Withdraw(0, msg.sender, amount, tokens[0][msg.sender]);
  }

  //remember to call Token(address).approve(this, amount) or this contract will not be able to do the transfer on your behalf.
  function depositToken(address token, uint amount) {
    require(token !=0);
    bool transferOk = TokenIErc20(token).transferFrom(msg.sender, this, amount);
    require(transferOk);
    tokens[token][msg.sender] += amount;
    Deposit(token, msg.sender, amount, tokens[token][msg.sender]);
  }

  function withdrawToken(address token, uint amount) {
    require(token !=0);
    require(tokens[token][msg.sender] >= amount);
    tokens[token][msg.sender] = safeSub(tokens[token][msg.sender], amount);
    bool transferOk = TokenIErc20(token).transfer(msg.sender, amount);
    require(transferOk);
    Withdraw(token, msg.sender, amount, tokens[token][msg.sender]);
  }

  function balanceOf(address token, address user) constant returns (uint) {
    return tokens[token][user];
  }
}