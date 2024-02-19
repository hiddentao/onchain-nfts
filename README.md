# Onchain NFTs

Smart contracts for testing the compatibility of various wallets, portfolio managers and marketplaces with on-chain NFTs. In particular, this checks for ERC721 `tokenURI()` functions returning data URIs wherein all the metadata is stored on-chain, including the image data.

The metadata looks something like:

```json
{
  "name": "Onchain #1",
  "description": "image prop - PNG data URI (big - 4286 bytes)",
  "attributes": [
    {
      "display_type": "date",
      "trait_type": "When",
      "value": "2024-09-09"
    }
  ],
  "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAAJYCAIAAAAxBA+LAAAK2UlEQVR4nOzXvasQ1B/H8d8VxeHX0D... (3802 bytes total)"
}
```

For preliminary findings, see:

* https://twitter.com/hiddentao/status/1759499716583162210
* https://warpcast.com/hiddentao/0xa4e2a58c

Example gas costs:

* Calling `setTokenURI()` with JSON metadata containing 3802 byte PNG image: `0.074858856538066125 ETH (497077 gas * 150.598109625 gwei)`

## On-chain addresses

* Polygon: [0xB4D3973637369692981C7C40f7a733a04b2D0E9c](https://polygonscan.com/address/0xB4D3973637369692981C7C40f7a733a04b2D0E9c)
  * See the NFTs: https://polygon.nftscan.com/0xB4D3973637369692981C7C40f7a733a04b2D0E9c

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
