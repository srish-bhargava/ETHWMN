// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.7.0;

contract DeadManSwitch {

    address public owner;
    address payable designatedAddress;
    uint256 public lastBlockCalled = 0;

    constructor () public payable{
        designatedAddress = payable(0xc03AccD3307dD8C8aaEcC4C0BCaAcb2CEF1645bF);
        owner = msg.sender;
    }
    modifier onlyOwner(){
            require(msg.sender == owner);
            _;
        }
    
    function still_alive() external onlyOwner{
        lastBlockCalled = block.number; 
    }

    function checkIfOwnerAccountStillActive() public returns (bool) {
        if (block.number - lastBlockCalled > 10) {
            selfdestruct(designatedAddress);
            return false;
        }
        else {
            return true;
        }
        
    } 
}