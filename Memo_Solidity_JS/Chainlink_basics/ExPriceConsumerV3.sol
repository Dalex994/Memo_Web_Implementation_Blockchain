// SPDX-License-Identifier: Apache-2.0

/// @title Example of call AggregatorV3Interface on your contract to take the values ETH/USD
/// @author CryptoZombies.io

pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
    AggregatorV3Interface public priceFeed;

constructor() public {
    /// @dev put the address of your Chainlink  compatible network
    priceFeed = AggregatorV3Interface("YOUR_NETWORK_ADRRESS");
}

function getLatestPrice() public view returns (int) {
    /// @dev the only thing that interest us is the price
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
}

function getDecimals() public view returns (uint8) {
    /// @dev we make it in decimals it's more readable
    uint8 decimals = priceFeed.decimals();
    return decimals;
}
}
