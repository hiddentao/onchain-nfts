# Onchain NFTs

Smart contracts for testing the compatibility of various wallets, portfolio managers and marketplaces with on-chain NFTs.

## On-chain addresses

* Sepolia: [0xC59af5e6419f1b3252894AA79c6ac08f4dc1DB2b](https://sepolia.etherscan.io/address/0xC59af5e6419f1b3252894AA79c6ac08f4dc1DB2b)

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

_Note: This will output a log line that looks like: `export CONTRACT_ADDRESS=0x...` - you will need this below._

To set values:

```shell
$ export CONTRACT_ADDRESS="0x.."
$ bun local:set
```

### Deployment - public network

To deploy contracts:

```shell
$ export PRIVATE_KEY="0x..."
$ export RPC_URL="http://..."
$ export CHAIN_ID="..."
$ bun public:dep
```

_Note: This will output a log line that looks like: `export CONTRACT_ADDRESS=0x...` - you will need this below._

To set values:

```shell
$ export CONTRACT_ADDRESS="0x.."
$ bun public:set
```

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
