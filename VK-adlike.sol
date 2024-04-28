// SPDX-License-Identifier: MIT

// 1️⃣ Add id to Post Struct to make every Post Unique
// 2️⃣ Set the id to be the Post[] length 
// HINT: you do it in the createPost function
// 3️⃣ Add a function to like the post
// HINT: there should be 2 parameters, id and author
// 4️⃣ Add a function to unlike the post
// HINT: make sure you can unlike only if likes count is greater then 0
// 4️⃣ Mark both functions external

pragma solidity ^0.8.0;

contract VK {

    uint16 public MAX_POST_LENGTH = 280;

    struct Post {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Post[] ) public posts;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    function changePostLength(uint16 newPostLength) public onlyOwner {
        MAX_POST_LENGTH = newPostLength;
    }

    function createPost(string memory _content) public {
        require(bytes(_content).length <= MAX_POST_LENGTH, "Post is too long bro!" );

        Post memory newPost = Post({
            id: posts[msg.sender].length,  // Set the id to the current length of the user's posts array
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);
    }

    function likePost(address author, uint256 id) external {  
        require(posts[author][id].id == id, "POST DOES NOT EXIST");

        posts[author][id].likes++;
    }

    function unlikePost(address author, uint256 id) external {
        require(posts[author][id].id == id, "POST DOES NOT EXIST");
        require(posts[author][id].likes > 0, "POST HAS NO LIKES");
        
        posts[author][id].likes--;
    }

    function getPost(uint _i) public view returns (Post memory) {
        return posts[msg.sender][_i];
    }

    function getAllPosts(address _owner) public view returns (Post[] memory ){
        return posts[_owner];
    }

}
