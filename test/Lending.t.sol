// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Lending} from "../src/Lending.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LendingTest is Test {
    Lending public lending;

    address weth = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1;
    address usdc = 0xaf88d065e77c8cC2239327C5EDb3A432268e5831;

    function setUp() public {
        vm.createSelectFork("https://arb-mainnet.g.alchemy.com/v2/p73f5xUw-PnBOypRat8_mOQgy2j6dZRh", 335106369);
        lending = new Lending();
    }

    function test_supplyAndBorrow() public {
        deal(weth, address(this), 1e18);
        IERC20(weth).approve(address(lending), 1e18);

        lending.supplyAndBorrow(1e18, 100e6); //1e18 = 1 * 10^18 = 1 ether   

        assertEq(IERC20(usdc).balanceOf(address(this)), 100e6);
        console.log("usdc balance", IERC20(usdc).balanceOf(address(this)));
    }

}
