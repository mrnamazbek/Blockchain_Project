// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SocialMediaRegistration {
    // Event to announce the registration of a new user
    event NewUserRegistered(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
        uint256 followersCount;  // Additional field to track number of followers
    }

    // Mapping from address to user data
    mapping(address => User) public users;

    function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;
        newUser.followersCount = 0;  // Initialize followers count when registering
        
        // Emit the event to notify the registration
        emit NewUserRegistered(msg.sender, _username);
    }
}
