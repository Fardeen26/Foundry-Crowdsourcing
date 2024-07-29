//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user"); // make a new fake address for tnx

    function setUp() external {
        // fundMe = new FundMe();
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, 10 ether); // give USER addr a test amout of 10 ether
    }

    function testMinimumUSDIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        // test in the name of function is important else it will ignore the function
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testFundFailsWithoutEnoughETH() public {
        vm.expectRevert(); // the test will revert if the next line should revert
        fundMe.fund(); // agar enough eth nhi hoga tabhi revert hoga
    }

    modifier funded() {
        // me make modifier to fund the value so that we don't have to fund value in every test
        vm.prank(USER);
        fundMe.fund{value: 0.1 ether}();
        _;
    }

    function testFundUpdatesFundedDataStructure() public funded {
        // vm.prank(USER); // next tnx will be sent by the fake address USER
        // fundMe.fund{value: 0.1 ether}(); // 0.1 ether is also a magic num so we should make it const

        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, 0.1 ether);
    }

    function testAddsFunderToTheArrayOfFunders() public funded {
        // to test that funder array storing funders
        // vm.prank(USER);
        // fundMe.fund{value: 0.1 ether}();

        address funder = fundMe.getFunder(0);
        assertEq(funder, USER);
    }

    function testOnlyOwnerCanWithdraw() public funded {
        // vm.prank(USER);
        // fundMe.fund{value: 0.1 ether}();

        vm.prank(USER);
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testWithdrawWithASingleFunder() public funded {
        // Arrange
        // Act  :- this is the methodilogy for writting the test
        // Assert

        // Arrange
        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // Act
        vm.prank(fundMe.getOwner());
        fundMe.withdraw();

        // Assert
        uint256 endingOwnerBalance = fundMe.getOwner().balance;
        uint256 endingFundMeBalance = address(fundMe).balance;

        assertEq(endingFundMeBalance, 0); // we can ignore 0 as a magic number
        assertEq(
            startingFundMeBalance + startingOwnerBalance,
            endingOwnerBalance
        );
    }

    function testWithdrawFromMultipleFunders() public funded {
        // Arrange
        uint160 numberOfFunders = 10; // we are using uint160 bcs it has 20 bytes same as address so we can use to to create address
        uint160 startingFunderIndex = 1;

        for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
            //  vm.prank(); // new address generate
            //  vm.deal(); // put the value to new address

            // the hoax does the both work in one line
            hoax(address(i), 0.1 ether);
            fundMe.fund{value: 0.1 ether}();
        }

        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // Act
        vm.startPrank(fundMe.getOwner()); // another way to write vm.prank()
        fundMe.withdraw();
        vm.stopPrank();

        // Assert

        assert(address(fundMe).balance == 0); // another way of assertEq
        assert(
            startingOwnerBalance + startingFundMeBalance ==
                fundMe.getOwner().balance
        );
    }
}
