//SPDX-License-Identifier: MIT

// before mocks we have hardcoded to test priceFeed address only in sepolia and if we want to change tat we have to change everywhere so we write the mocks that help us to use any testne or mainnet without doing any changes by just wriytoing a mock

pragma solidity ^0.8.18;

// the helper config is is teh mock script that help us to dynamize our contract
// we we are on the local anvil, we deploy mock
// other wise, grab the existing address from the live network

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    uint8 public constant DECIMAL = 8; // these types of vallues are also called magic numbers that we generally not hardcoded
    int256 public constant INITIAL_PRICE = 2000e8; // 2000000000000000000

    constructor() {
        if (block.chainid == 11155111) {
            // return the current chainid we are on <11155111> is for sepolia
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig()
        public
        pure
        returns (NetworkConfig memory /*bcs it is a special type like string */)
    {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // sepolia price feed address
        });
        return sepoliaConfig;
    }

    function getMainnetEthConfig()
        public
        pure
        returns (NetworkConfig memory /*bcs it is a special type like string */)
    {
        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419 // sepolia price feed address
        });
        return ethConfig;
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }

        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator( // this is the real mocking and mocing are simulated versions of smart contracts used for testing purposes
            DECIMAL,
            INITIAL_PRICE
        );
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });

        return anvilConfig;
    }
}
