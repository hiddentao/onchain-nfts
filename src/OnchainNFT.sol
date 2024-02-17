// SPDX-License-Identifier: GPLv3
pragma solidity ^0.8.24;

import { ERC721 } from "openzeppelin/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "openzeppelin/token/ERC721/extensions/ERC721URIStorage.sol";
import { Base64 } from "openzeppelin/utils/Base64.sol";
import { Strings } from "openzeppelin/utils/Strings.sol";
import { Ownable } from "openzeppelin/access/Ownable.sol";

contract OnchainNFT is ERC721, ERC721URIStorage, Ownable {
  using Strings for uint256;

  // Constructor

  constructor()
    ERC721("Onchain", "ONCHAIN") 
    Ownable(_msgSender())
  {
  }

  function setTokenURI(uint256 tokenId, string memory _tokenURI) external {
    _setTokenURI(tokenId, _tokenURI);
  }
}
