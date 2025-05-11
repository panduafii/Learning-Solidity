// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    Token public token;

    address public Alice = makeAddr("Alice");
    address public Bob = makeAddr("Bob");

    function setUp() public {
        token = new Token();
    }

    function test_mint() public {
        token.mint(Alice, 2000);
        assertEq(token.balanceOf(Alice), 2000);
        console.log("balance of alice", token.balanceOf(Alice));

        token.mint(Bob, 3000);
        assertEq(token.balanceOf(Bob), 3000);
        console.log("balance of Bob", token.balanceOf(Bob));

        token.mint(address(this), 1000);
        assertEq(token.balanceOf(address(this)), 1000);
        console.log("balance of this", token.balanceOf(address(this)));
    }
}
