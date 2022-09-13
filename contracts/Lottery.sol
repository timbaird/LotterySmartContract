//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Lottery{
    address payable[] public players;
    address payable public  manager;

    constructor(){
        manager = payable(msg.sender);
        players.push(manager);
    }

    receive() external payable{
        require(msg.sender != manager);
        require(msg.value == 0.01 ether, "This contract only accepts transactions of 0.01 ether");
        players.push(payable (msg.sender));
    }

    modifier onlyOwner(){
        require (msg.sender == manager);
        _;
    }

    function getBalance() public view onlyOwner returns (uint){
        return address(this).balance;
    }

    function random() internal view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public onlyOwner{
        require(players.length >= 10);
        // select the winner
        uint r = random();
        uint winningIndex = r % players.length;
        address payable winner = players[winningIndex];
        //work out the prize money division
        uint winnersShare = address(this).balance * 9 / 10;
        uint managersTax = address(this).balance - winnersShare;
        // pay everyone
        winner.transfer(winnersShare);
        manager.transfer(managersTax);
        // reset the lottery
        players = new address payable [] (0); // resets the lottery
        players.push(manager);
    }
}