// SPDX-License-Identifier: GPLv3
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {OnchainNFT} from "src/OnchainNFT.sol";

contract DeployScript is Script {
    function run() public {
        address wallet = msg.sender;

        vm.startBroadcast(wallet);

        OnchainNFT nft = new OnchainNFT();
        console.log("export CONTRACT_ADDRESS=%s", address(nft));

        vm.stopBroadcast();        
    }
}