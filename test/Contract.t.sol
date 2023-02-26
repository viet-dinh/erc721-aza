// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Aza.sol";

contract ContractTest is Test {
    Contract drop;
    address testAddress = makeAddr("test");

    function setUp() public {
        drop = new Contract("MintTest", "MT", testAddress, 500, testAddress);
    }

    function testExample() public {
        assertTrue(true);
    }

    function testDropWithZeroToken() public {
        vm.expectRevert("At least 1 token when minting");
        drop.mint(testAddress, 0);
        assertEq(drop.balanceOf(testAddress), 0);
    }  

    function testDropMintSuccess() public {
        drop.mint(testAddress, 1);
        assertEq(drop.balanceOf(testAddress), 1);
    }  
}
