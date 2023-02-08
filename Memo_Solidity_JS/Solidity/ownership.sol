// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.9;

import "./erc721.sol";
import "./safemath.sol";


/// @title A Basic Exemple of a single securised transfer from the blockchain using crurrency ETH
contract Ownership is "YOUR_Parent", ERC721 {
/// using SafeMath to make sure there are securised
  using SafeMath for uint256;

  mapping (uint => address) Approvals;

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerObjectCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    return objectToOwner[_tokenId];
  }
  
  /// @dev Twice the function private because it's for securising the process & make sure it safe
  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerObjectCount[_to] = ownerObjectCount[_to].add(1);
    ownerObjectCount[msg.sender] = ownerObjectCount[msg.sender].sub(1);
    objectToOwner[_tokenId] = _to;
    Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    _transfer(msg.sender, _to, _tokenId);
  }

  function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    objectApprovals[_tokenId] = _to;
    Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint256 _tokenId) public {
    require(objectApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }
}



