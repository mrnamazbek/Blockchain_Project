// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣  Use require to limit the length of the post to be only 280 characters

contract VK {

    // Define our struct
    uint16 constant MAX_POST_LENGTH = 280;

    struct Post {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // Mapping to store posts
    mapping(address => Post[] ) public posts;

    // Function to create a new post
    function createPost(string memory _content) public {
        // Conditional to check if post length <= 280 characters, otherwise revert
        require(bytes(_content).length <= MAX_POST_LENGTH, "Post is too long bro!" );

        Post memory newPost = Post({
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);
    }

    // Function to get a specific post by index for the current user
    function getPost(uint _index) public view returns (Post memory) {
        return posts[msg.sender][_index];
    }

    // Function to get all posts by a specific owner
    function getAllPosts(address _owner) public view returns (Post[] memory) {
        return posts[_owner];
    }

}
