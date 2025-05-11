// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault is ERC20 {
    address public usdc;

    constructor(address _usdc) ERC20("Vault", "VAULT") {
        usdc = _usdc;
    }

    function deposit(uint256 amount) public {
        uint256 totalAsset = IERC20(usdc).balanceOf(address(this));
        uint256 totalShares = totalSupply();

        uint256 shares = 0;
        if (totalShares == 0) {
            shares = amount;
        } else {
            shares = amount * totalShares / totalAsset;
        }

        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, shares);
    }

    function withdraw(uint256 shares) public {
        uint256 totalAsset = IERC20(usdc).balanceOf(address(this));
        uint256 totalShares = totalSupply();

        uint256 amount = shares * totalAsset / totalShares;

        _burn(msg.sender, shares);
        IERC20(usdc).transfer(msg.sender, amount);
    }

    // Add yield to the vault without minting new shares
    function distributeYield(uint256 amount) public {
        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
        // No minting of shares, so share value increases
    }
}
