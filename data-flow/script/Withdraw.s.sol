// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {WithdrawContract} from "../src/WithdrawContract.sol";

contract WithdrawScript is Script {
    WithdrawContract public withdrawContract;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        withdrawContract = new WithdrawContract(4000);

        vm.stopBroadcast();
    }
}
