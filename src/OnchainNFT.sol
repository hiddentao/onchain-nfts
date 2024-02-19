// SPDX-License-Identifier: GPLv3
pragma solidity ^0.8.24;

import { ERC721 } from "openzeppelin/token/ERC721/ERC721.sol";
import { ERC721Enumerable } from "openzeppelin/token/ERC721/extensions/ERC721Enumerable.sol";
import { ERC721URIStorage } from "openzeppelin/token/ERC721/extensions/ERC721URIStorage.sol";
import { Strings } from "openzeppelin/utils/Strings.sol";
import { Ownable } from "openzeppelin/access/Ownable.sol";

contract OnchainNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
  using Strings for uint256;

  uint lastTokenId;

  constructor(string memory name, string memory symbol)
    ERC721(name, symbol)
    Ownable(_msgSender())
  {
  }

  function _update(address to, uint256 tokenId, address auth) internal override(ERC721, ERC721Enumerable) returns (address) {
    return ERC721Enumerable._update(to, tokenId, auth);
  }

  function _increaseBalance(address account, uint128 amount) internal override(ERC721, ERC721Enumerable) {
    ERC721Enumerable._increaseBalance(account, amount);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable, ERC721URIStorage) returns (bool) {
    return ERC721Enumerable.supportsInterface(interfaceId)
      || ERC721URIStorage.supportsInterface(interfaceId)
      || ERC721.supportsInterface(interfaceId);
  }

  function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return ERC721URIStorage.tokenURI(tokenId);
  }

  function setTokenURI(uint256 tokenId, string memory _tokenURI) external {
    _setTokenURI(tokenId, _tokenURI);
  }

  function mint(address to, string memory _tokenURI) external onlyOwner {
    lastTokenId++;
    _safeMint(to, lastTokenId);
    _setTokenURI(lastTokenId, _tokenURI);
  }
}
