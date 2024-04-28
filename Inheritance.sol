// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MultiplayerGame {
    mapping(address => bool) public players;

    function joinGame() public virtual {
        players[msg.sender] = true;
    }
}

contract Game is MultiplayerGame {
    string public gameName;
    uint256 public playerCount;
    bool public gameStarted;

    event PlayerJoined(address player);
    event GameStarted();

    constructor(string memory _gameName) {
        gameName = _gameName;
        playerCount = 0;
        gameStarted = false;
    }

    function startGame() public {
        require(!gameStarted, "Game has already started");
        gameStarted = true;
        emit GameStarted();
    }

    function joinGame() public override {
        require(!gameStarted, "Game already started");
        require(players[msg.sender] == false, "Player already joined");
        super.joinGame();
        playerCount++;
        emit PlayerJoined(msg.sender);
    }
}
