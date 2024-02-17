// SPDX-License-Identifier: GPLv3
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {OnchainNFT} from "src/OnchainNFT.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();

        OnchainNFT nft = new OnchainNFT();
        console.log(address(nft));
        console.log(nft.name());
    }
}