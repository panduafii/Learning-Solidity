// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Price} from "../src/Price.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PriceTest is Test {
    Price public price;

    function setUp() public {
        vm.createSelectFork("https://arb-mainnet.g.alchemy.com/v2/p73f5xUw-PnBOypRat8_mOQgy2j6dZRh", 335437150);
        price = new Price();
    }

    function testGetPrice() public {
        uint256 price_ = price.getPrice();
        console.log("Price: %s", price_);
    }
}
