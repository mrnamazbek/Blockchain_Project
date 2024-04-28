// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Define a Post Struct with author, content, timestamp, likes
// 2️⃣ Add the struct to array
// 3️⃣ Test Posts

contract VK {

    // Define our struct
    struct Post {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // Mapping to store posts by address
    mapping(address => Post[]) public posts;

    // Function to create a new post
    function createPost(string memory _content) public {
        Post memory newPost = Post({
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);
    }

    // Function to get a specific post by index
    function getPost(address _owner, uint _index) public view returns (Post memory) {
        return posts[_owner][_index];
    }

    // Function to get all posts by a specific owner
    function getAllPosts(address _owner) public view returns (Post[] memory) {
        return posts[_owner];
    }
}
