// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {WithdrawContract} from "../src/WithdrawContract.sol";

contract WithdrawContractTest is Test {
    WithdrawContract public contract;
    address public owner;
    address public user;

    function setUp() public {
        owner = address(this);
        user = address(0x1);
        contract = new WithdrawContract(5000);
    }

    // Test constructor
    function testConstructor() public {
        assertEq(contract.owner(), owner);
        assertEq(contract.balance(), 5000);
    }

    // Test withdraw function - all possible paths
    function testWithdrawAccessDenied() public {
        vm.prank(user);
        string memory result = contract.withdraw(100);
        assertEq(result, "Access Denied");
        assertEq(contract.balance(), 5000);
    }

    function testWithdrawInvalidAmount() public {
        string memory result = contract.withdraw(0);
        assertEq(result, "Invalid amount");
        assertEq(contract.balance(), 5000);
    }

    function testWithdrawInsufficientFunds() public {
        string memory result = contract.withdraw(6000);
        assertEq(result, "Inufficient funds");
        assertEq(contract.balance(), 5000);
    }

    function testWithdrawLimitExceeded() public {
        string memory result = contract.withdraw(3001);
        assertEq(result, "Limit exceeded");
        assertEq(contract.balance(), 5000);
    }

    function testWithdrawSuccessful() public {
        string memory result = contract.withdraw(1000);
        assertEq(result, "Withdraw successful");
        assertEq(contract.balance(), 4000);
    }

    // Test multiple withdrawals
    function testMultipleWithdrawals() public {
        string memory result1 = contract.withdraw(1000);
        assertEq(result1, "Withdraw successful");
        assertEq(contract.balance(), 4000);

        string memory result2 = contract.withdraw(2000);
        assertEq(result2, "Withdraw successful");
        assertEq(contract.balance(), 2000);

        string memory result3 = contract.withdraw(1000);
        assertEq(result3, "Withdraw successful");
        assertEq(contract.balance(), 1000);
    }
} 