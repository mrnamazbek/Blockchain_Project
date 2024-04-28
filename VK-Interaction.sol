// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Profile {
    struct UserProfile {
        string displayName;
        string bio;
    }
    
    mapping(address => UserProfile) public profiles;

    // Event to log profile updates for better traceability
    event ProfileUpdated(address user, string displayName, string bio);

    function setProfile(string memory _displayName, string memory _bio) public {
        // Update the user's profile
        profiles[msg.sender] = UserProfile(_displayName, _bio);

        // Emit an event upon updating the profile
        emit ProfileUpdated(msg.sender, _displayName, _bio);
    }

    function getProfile(address _user) public view returns (UserProfile memory) {
        return profiles[_user];
    }
}
