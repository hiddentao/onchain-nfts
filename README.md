# Onchain NFTs

Smart contracts for testing the compatibility of various wallets, portfolio managers and marketplaces with on-chain NFTs. In particular, this checks for ERC721 `tokenURI()` functions returning data URIs wherein all the metadata is stored on-chain, including the image data.

Preliminary findings:

* SVG and PNG data URIs work fine. 
* The data URI length can be several KB. In fact, the [latest browsers support atleast 64 KB length](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs#length_limitations).
* It's expensive to write KB of data to a storage slot (duh!), so an L2 with low gas price (e.g 1 Gwei) is essential to minimize overall cost to caller.
* No need to use `image_raw` property since `image` works fine enough.

Example gas costs:

* Calling `setTokenURI()` with JSON metadata containing 3802 byte PNG image: `0.074858856538066125 ETH (497077 gas * 150.598109625 gwei)`

## On-chain addresses

* Sepolia: [0xC59af5e6419f1b3252894AA79c6ac08f4dc1DB2b](https://sepolia.etherscan.io/address/0xC59af5e6419f1b3252894AA79c6ac08f4dc1DB2b)
* Polygon: [0x7d6D005eC1CC8ec979fb6d439FbE9c96F9ed3AB0](https://polygonscan.com/address/0x7d6D005eC1CC8ec979fb6d439FbE9c96F9ed3AB0)
  * See the NFTs: https://polygon.nftscan.com/0x7d6d005ec1cc8ec979fb6d439fbe9c96f9ed3ab0

## Developer guide

Install pre-requisites:

* [Foundry](https://book.getfoundry.sh/)
* [Bun](https://bun.sh/)

Then run:

```shell
$ bun i
$ bun prepare
```

To compile the contracts:

```shell
$ bun compile
```

To run a local devnet:

```shell
$ bun devnet
```

### Deployment - local

To deploy contracts:

```shell
$ bun local:dep
```

To set values _(substitute the correct `CONTRACT_ADDRESS` value)_:

```shell
$ CONTRACT_ADDRESS="0x.." bun local:set
```

### Deployment - public network

To deploy contracts:

```shell
$ export PRIVATE_KEY="0x..."
$ export RPC_URL="http://..."
$ export CHAIN_ID="..."
$ bun public:dep
```

To set values _(substitute the correct `CONTRACT_ADDRESS` value)_:

```shell
$ CONTRACT_ADDRESS="0x.." bun public:set
```

### Debugging

Useful tools for debugging NFT metadata and testing images:

* https://viewer.etovass.xyz/ (github: https://github.com/etovass/svg-nft-tutorials/tree/main/nextjs-tooling/nft-viewer)
* https://polygon-nfts.com/ - view NFTs on polygon by contract address, etc.
* https://nftscan.com/ - multi-chain NFT viewer

## License

GPLv3 - see [LICENSE.md](LICENSE.md)

Naym-Coin smart contracts
Copyright (C) 2024  [Ramesh Nair](https://hiddentao.com)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
