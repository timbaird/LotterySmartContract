# Lottery Smart Contract

Built as a project whilst working through this course: 
https://www.udemy.com/course/master-ethereum-and-solidity-programming-with-real-world-apps/

A decentralised lottery application.

1. Lottery starts by acepting ETH transactions. Anyone having an Ethereum wallet can send a fixed amount of ETH (may vary by contract deployment, but will start with 0.01 ETH) to the contracts address.

2. The players send ETH directly to the contract address and thier Ethereum address is registered. A user can send more than one transaction for more than one chance to win.

3. There is a manager, the account that deploys and controls the contract.

4. At some point, if there are at least 3 players, the manager can pick a random winner from the players list. Only the manager id allowed to see the conrtact balance and to randomly select the winner.

5. The conrtract will transfer the entire balance to the winners address and the lottery is reset and ready for the next round.
