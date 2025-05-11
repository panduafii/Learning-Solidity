// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    address public Alice = makeAddr("Alice"); //Membuat akun alice

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_setPrice() public {
        vm.prank(Alice); //prank sebagai alice
        vm.expectRevert("Only owner can set price"); //Harus sama dengan yang di src, karena ini adalah testnya
        counter.setPrice(100);

        vm.prank(address(this)); //prank sebagai owner
        counter.setPrice(100);
        assertEq(counter.price(), 100);
        console.log("Price set to 100");
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
