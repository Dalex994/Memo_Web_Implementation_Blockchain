// SPDX-License-Identifier: Apache-2.0

/// @title How to get a random number drom ChainlinkVRF (simple example)
/// @author CryptoZombies.io

pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract ZombieFactory is VRFConsumerBase {
    
    /// @dev define our variables
    bytes32 public keyHash;
    uint256 public fee;
    uint256 public randomResult;

    constructor() VRFConsumerBase(
    /// Our adrress (chack Chainlink documentation to know your own)
        "YOUR_NETWORK_ADDRESS", // VRF Coordinator
        "YOUR_LINK_ADRRESS"  // LINK Token 
    ) public{
        keyHash = "YOUR_KEYHASH_ADDRESS";
        fee = 100000000000000000;

    }

/// @dev Call the function from the VRF for the first-step transmitting
    function getRandomNumber() public returns (bytes32 requestId) {
        return requestRandomness(keyHash, fee);
    }

/// @dev Verify and return for the second step and return of the random number (uint256)
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }

}
