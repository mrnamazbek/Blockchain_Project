# VK Social Media Smart Contract

Welcome to the VK Social Media Smart Contract repository! This project demonstrates a simple social media platform built on the Ethereum blockchain. Users can create posts, like and unlike posts, and query posts from the blockchain.


## Features

- **Create Posts**: Users can add content to the blockchain, which is timestamped and stored securely.
- **Interact with Posts**: Each post can be liked or unliked, with the total like count stored on-chain.
- **Query Posts**: Users can retrieve a single post or all posts created by a specific user.
- **Adjust Post Settings**: The contract owner can adjust the maximum post length.

## Project Images

Below are the images depicting the step-by-step execution of contract functions along with their corresponding transactions on Etherscan.

### Contract Deployment
![telegram-cloud-photo-size-2-5294440722067478341-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/cbf16316-e735-4402-8e49-ebc33ebbdac8)

*Contract deployment on Remix IDE with MetaMask integration on the Sepolia testnet.*
![telegram-cloud-photo-size-2-5294440722067478343-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/038a1f04-2044-4be7-87f1-3fbdde59dba0)


### Change Post Length
![telegram-cloud-document-2-5294440721611245614](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/04a07f7f-c35e-443a-a828-e9e3c6169454)

*Updating the maximum length of a post by the contract owner.*


### Create Post
![telegram-cloud-document-2-5294440721611245616](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/a9f4e77c-be03-4abf-a330-0facbca9beff)

*Creating a new post through the smart contract.*


### Like Post
![telegram-cloud-photo-size-2-5294440722067478355-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/3175a775-d679-42ab-96b1-43c44179703e)
![telegram-cloud-photo-size-2-5294440722067478356-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/9abadea1-c2cc-4631-b8a0-973b6a85f42c)

*Liking a post, a transaction shown in the wallet and Etherscan.*


### Unlike Post
![telegram-cloud-photo-size-2-5294440722067478360-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/5baa1d25-31d4-4286-a42d-ccf14212c42c)
*Unliking a post and viewing the transaction on Etherscan.*


### Get Total Likes for a User
![telegram-cloud-photo-size-2-5294440722067478358-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/1cd07e30-5656-492d-b672-36e45dc83382)

Finally, `getTotalLikes` calculates and returns the sum of likes across all posts made by a particular user, providing a measure of the user's overall engagement on the platform.


### Get All Posts by a User
![telegram-cloud-photo-size-2-5294440722067478361-y](https://github.com/mrnamazbek/Blockchain_Project/assets/119422414/dffe8eae-dd0f-4b69-bcf9-bcdd1a853604)

To display a user's entire posting history, `getAllPosts` returns an array of all posts made by a specific user, identified by their Ethereum address.



## Getting Started

To interact with this smart contract:

1. Deploy the contract using Remix IDE and MetaMask.
2. Use the functions provided in the Remix interface to create and interact with posts.
3. To view transaction details, use a testnet version of Etherscan.

## Testing Logs

Here are some of the logs that have been captured during the testing of the smart contract:



## Interacting with the Contract

To interact with the deployed contract:

- Visit [Remix Ethereum IDE](https://remix.ethereum.org).
- Connect to the Sepolia test network through MetaMask.
- Load the deployed contract using its address.

## Contributions

We welcome contributions and suggestions! Feel free to fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
