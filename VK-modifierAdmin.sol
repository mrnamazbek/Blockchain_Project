// SPDX-License-Identifier: MIT

// 1️⃣ Add a function called changePostLength to change max post length
// HINT: use newPostLength as input for function
// 2️⃣ Create a constructor function to set an owner of contract
// 3️⃣ Create a modifier called onlyOwner
// 4️⃣ Use onlyOwner on the changePostLength function

pragma solidity ^0.8.0;

contract VK {

    uint16 public MAX_POST_LENGTH = 280;  // Default max post length

    struct Post {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Post[]) public posts;
    address public owner;

    constructor() {
        owner = msg.sender;  // Set the contract creator as the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    function changePostLength(uint16 newPostLength) public onlyOwner {
        MAX_POST_LENGTH = newPostLength;  // Change the max length of the post
    }

    function createPost(string memory _content) public {
        require(bytes(_content).length <= MAX_POST_LENGTH, "Post is too long bro!" );

        Post memory newPost = Post({
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);
    }

    function getPost(uint _i) public view returns (Post memory) {
        return posts[msg.sender][_i];
    }

    function getAllPosts(address _owner) public view returns (Post[] memory) {
        return posts[_owner];
    }

}
