// SPDX-License-Identifier: MIT

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

    // Define the events
    event PostCreated(uint256 id, address author, string content, uint256 timestamp);
    event PostLiked(address liker, address postAuthor, uint256 postId, uint256 newLikeCount);
    event PostUnliked(address unliker, address postAuthor, uint256 postId, uint256 newLikeCount);

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

    function getTotalLikes(address _author) external view returns(uint totalLikes) {
        for(uint i = 0; i < posts[_author].length; i++) {
            totalLikes += posts[_author][i].likes;
        }
        return totalLikes;
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

        // Emit the PostCreated event
        emit PostCreated(newPost.id, newPost.author, newPost.content, newPost.timestamp);
    }

    function likePost(address author, uint256 id) external {  
        require(posts[author][id].id == id, "POST DOES NOT EXIST");

        posts[author][id].likes++;

        // Emit the PostLiked event
        emit PostLiked(msg.sender, author, id, posts[author][id].likes);
    }

    function unlikePost(address author, uint256 id) external {
        require(posts[author][id].id == id, "POST DOES NOT EXIST");
        require(posts[author][id].likes > 0, "POST HAS NO LIKES");
        
        posts[author][id].likes--;

        // Emit the PostUnliked event
        emit PostUnliked(msg.sender, author, id, posts[author][id].likes);
    }

    function getPost(uint _i) public view returns (Post memory) {
        return posts[msg.sender][_i];
    }

    function getAllPosts(address _owner) public view returns (Post[] memory) {
        return posts[_owner];
    }

}
