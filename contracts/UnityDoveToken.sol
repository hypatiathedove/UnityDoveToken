// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import ERC20 from a specific OpenZeppelin release
import "@openzeppelin/contracts@4.4.1/token/ERC20/ERC20.sol";

contract UnityDoveToken is ERC20 {
    constructor() ERC20("Unity Dove Token", "UDT") {
        _mint(msg.sender, 1e9 * 1e18); // Mint 1 billion tokens (1e9) with 18 decimals (1e18)
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = amount / 100; // Calculate 1% of the transaction to burn
        uint256 transferAmount = amount - burnAmount;
        super._burn(sender, burnAmount); // Burn 1%
        super._transfer(sender, recipient, transferAmount); // Transfer the rest
    }
}
