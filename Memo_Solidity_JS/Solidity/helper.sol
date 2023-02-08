// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.89;

import "./ownership.sol";

/// @title Example to define gas fees on Dapp with the OnlyOwner modifier
contract Helper is Ownership {

  uint levelUpFee = 0.001 ether;

  modifier aboveLevel(uint _level, uint _objectId) {
    require(objects[_objectId].level >= _level);
    _;
  }

  function withdraw() external onlyOwner {
    owner.transfer(this.balance);
  }

  function setLevelUpFee(uint _fee) external onlyOwner {
    levelUpFee = _fee;
  }

/// @param objects[] is a list from another contract(example)
  function levelUp(uint _objectId) external payable {
    require(msg.value == levelUpFee);
    objects[_objectId].level++;
  }
}