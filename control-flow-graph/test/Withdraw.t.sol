// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {WithdrawContract} from "../src/WithdrawContract.sol";

contract WithdrawTest is Test {
    WithdrawContract public withdrawContract;

    function setUp() public {
        withdrawContract = new WithdrawContract(4000);
    }

    // test case 1
    function test_withdraw_1() public {
        string memory resp = withdrawContract.withdraw(1000);
        assertEq(resp, "Withdraw successful");
    }

    // test case 2
    function test_withdraw_2() public {
        string memory resp = withdrawContract.withdraw(-10);
        assertEq(resp, "Invalid amount");
    }

    // test case 3
    function test_withdraw_3() public {
        string memory resp = withdrawContract.withdraw(4500);
        assertEq(resp, "Inufficient funds");
    }

    // test case 4
    function test_withdraw_4() public {
        string memory resp = withdrawContract.withdraw(3500);
        assertEq(resp, "Limit exceeded");
    }
}
