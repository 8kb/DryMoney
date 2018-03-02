pragma solidity ^0.4.18;
import "./DemoToken.sol";

contract Factory {
    DemoToken child;
    function Factory() public {
        child = new DemoToken();
        child.mint(msg.sender, 100);
    }
}