// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract GES is ERC20PresetMinterPauserUpgradeable, OwnableUpgradeable {
    
    uint256 public approveSwitch;

    function initialize(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) initializer public virtual {
        __Ownable_init_unchained();
        __ERC20PresetMinterPauser_init(name, symbol);
        _mint(msg.sender, initialSupply);
        approveSwitch = 1;
    }

    function approve(address spender, uint amount) public virtual override returns (bool success) {
        if (approveSwitch  == 1) {
            return false;
        }

		return super.approve(spender, amount);
    }

    function approveV2(address spender, uint amount) public virtual returns (bool success) {
        return super.approve(spender, amount);
    }

	function setApproveSwitch(uint256 _approveSwitch) public virtual onlyOwner {
		approveSwitch = _approveSwitch;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function version() public virtual pure returns (string memory) {
        return "v1";
    }
}

contract GESV2 is GES
{
    function approve(address spender, uint amount) public virtual override returns (bool success) {
		return super.approve(spender, amount);
    }

    function approveV2(address spender, uint amount) public virtual override returns (bool success) {
        require(false, "approveV2 is obsolete");
        return false;
    }

    function mint(address to, uint256 amount) public virtual override {
        require(false, "mint is disabled");
    }
}