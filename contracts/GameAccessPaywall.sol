// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GameAccessPaywall {
    address public owner;
    uint256 public accessFee;

    constructor(uint256 _accessFee) {
        owner = msg.sender;
        accessFee = _accessFee; // Sets the access rate, in wei
    }

    // Função que permite o pagamento para acessar a funcionalidade
    function payForAccess() external payable {
        require(msg.value >= accessFee, "Insufficient funds to access the game");
	// Process the transaction (for example, you can store something related to access)

	// If the amount sent is larger than necessary, the excess is returned to the user
        if (msg.value > accessFee) {
            payable(msg.sender).transfer(msg.value - accessFee); // Returning the change
        }
    }

    //Function for the owner to withdraw the accumulated balance
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    // Function that allows you to adjust the access rate
    function setAccessFee(uint256 newFee) external {
        require(msg.sender == owner, "Only owner can set fee");
        accessFee = newFee;
    }

    // Function to view the contract balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

