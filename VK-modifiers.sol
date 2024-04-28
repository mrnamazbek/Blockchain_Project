// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PausableCredit {
    address public owner;
    bool public paused;
    mapping(address => uint) public credits;

    constructor() {
        owner = msg.sender;
        paused = false;
        credits[owner] = 1000; // Initial credit given to the owner, can represent some form of social currency or points
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier notPaused() {
        require(!paused, "Service is currently paused");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    function transferCredits(address to, uint amount) public notPaused {
        require(credits[msg.sender] >= amount, "Insufficient credits");

        credits[msg.sender] -= amount;
        credits[to] += amount;
    }
}
