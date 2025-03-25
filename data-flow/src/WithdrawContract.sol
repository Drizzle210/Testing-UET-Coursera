// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract WithdrawContract {
    int256 public balance;
    address public owner;

    constructor(int256 initialBalance) {
        owner = msg.sender;
        balance = initialBalance;
    }

    function withdraw(int256 amountIn) public returns (string memory){
        if (msg.sender != owner) {
            return "Access Denied";
        } else if(amountIn <= 0) {
            return "Invalid amount";
        } else if(amountIn > balance) {
            return "Inufficient funds";
        } else if(amountIn > 3000) {
            return "Limit exceeded";
        }
        
        balance -= amountIn;
        return "Withdraw successful";
    }
}
