// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/1_Storage.sol";

contract StorageTest {

    Storage storageToTest;
    
    function beforeAll () public {
        storageToTest = new Storage();
    }

    function test1_success () public {
        uint256 number = 20;
        storageToTest.store(number);
        Assert.equal(storageToTest.retrieve(), uint256(20), "retreive equal");
    }

    function test2_success () public {
        uint256 number = 2943045;
        storageToTest.store(number);
        Assert.equal(storageToTest.retrieve(), number, "retreive equal");
    }

    function test3_failure () public {
        uint number = 0;
        storageToTest.store(number);
        uint retreived = storageToTest.retrieve();
        Assert.ok(retreived == 56, "test failed, value retrieved not same");
    }
}