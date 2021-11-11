// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";

contract GES is ERC20PresetMinterPauserUpgradeable {
    
    function initialize(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) initializer public virtual {

        __ERC20PresetMinterPauser_init(name, symbol);
        _mint(msg.sender, initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return 5;
    }

    function version() public virtual pure returns (string memory) {
        return "v1";
    }
}

contract GESV2 is GES {

    function approveV2(address spender, uint amount) public virtual returns (bool success) {
        return super.approve(spender, amount);
    }

    function version() public virtual override pure returns (string memory) {
        return "v2";
    }
}