// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactory is Ownable {
    event TokenCreated(address indexed tokenAddress, string name, string symbol, uint256 initialSupply);

    constructor() Ownable(msg.sender) {} // Adiciona o proprietário ao contrato

    function createToken(string memory name, string memory symbol, uint256 initialSupply) external {
        bytes32 salt = keccak256(abi.encodePacked(msg.sender, name, symbol, initialSupply));
        Token newToken = new Token{salt: salt}(name, symbol, initialSupply, msg.sender);
        emit TokenCreated(address(newToken), name, symbol, initialSupply);
    }
}

contract Token is ERC20, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialSupply, address creator)
        ERC20(name, symbol)
        Ownable(creator) // Passa o dono correto
    {
        _mint(creator, initialSupply * 10 ** decimals());
    }
}

