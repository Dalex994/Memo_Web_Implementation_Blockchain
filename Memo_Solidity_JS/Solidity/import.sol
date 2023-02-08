// SPDX-License-Identifier: Apache-2.0

pragma solidity 0.8.9;

/// @title An example when you want to import an another contract via API

  /// @dev The Patent is show in this build with a couple of data for examples
  PatentInterface PatentContract;
  contract PatentInterface {
  function getPatent(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
}
function setPatentContractAddress(address _address) external onlyOwner {
    patentContract = PatentInterface(_address);
  }
  
/// @dev The modifier onlyOwnerOf can determinate what type of functions can be modified only by the Owner
//   It's used in the others examples

modifier onlyOwnerOf(uint _objectId) {
    require(msg.sender == objectToOwner[_objectId]);
    _;
}



