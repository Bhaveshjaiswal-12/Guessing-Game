# Number Guessing Game Smart Contract

This is a simple **Number Guessing Game** smart contract written in Solidity.
Players can participate in the game by guessing a randomly generated number between 1 and 100. If they guess the correct number, they win a prize (1 Ether). This contract is deployed on **EduChain**.

### Deployed Contract Address
The smart contract is deployed on EduChain at the following address:

**0x0a58eE83Ad4b12c65a031C350086545a93c04122**

### Features of the Guessing Game

- **Start Game**: Any user can start the game by sending Ether to the contract. The game is initiated and the random number is generated.
- **Guessing**: Players can make guesses by calling the `guessNumber()` function. The guess must be between 1 and 100.
- **Prize Distribution**: If a player's guess matches the randomly generated number, they win the prize (1 Ether) and the game is reset.
- **Prize Pool**: Users can view the current prize pool with the `getPrizePool()` function.
- **Winner Info**: The winner’s address can be accessed using the `getWinner()` function.

### How to Interact with the Contract

1. **Start the Game**: 
    - Call the `startGame()` function and send Ether to initiate the game.
  
2. **Make a Guess**:
    - Call the `guessNumber()` function with a number between 1 and 100 as the guess. The correct guess wins the prize.
  
3. **View Current Status**:
    - Use the `getPrizePool()` function to see the current prize pool.
    - Use the `getWinner()` function to see who the last winner was.

### Smart Contract Functions

- **startGame()**: Starts the game and accepts Ether to fund the prize pool.
- **guessNumber(uint256 _guess)**: Allows a user to guess the number. If correct, they win the prize.
- **getPrizePool()**: Returns the current prize pool balance.
- **getWinner()**: Returns the address of the last winner.
- **receive()**: A fallback function to handle unexpected Ether transactions.

### Example of Interacting with the Contract

1. **Start a new game** (send 1 Ether or more):
    - Call `startGame()` from your wallet or a DApp interface (e.g., Remix, Ethers.js).
   
2. **Make a guess** (between 1 and 100):
    - Call `guessNumber()` with your chosen number.

3. **Check the prize pool and winner**:
    - Call `getPrizePool()` to check how much is in the prize pool.
    - Call `getWinner()` to see who won the last game.

### Requirements

- **Solidity Version**: 0.8.0 or higher.
- **Ethereum-based Network**: This contract is deployed on EduChain.

### License

This project is open-source and available under the MIT License.

---

### Disclaimer
Please note that this contract uses basic pseudo-random number generation based on `block.timestamp` and `block.difficulty`.
This is not suitable for production use or high-stakes games. For more secure random number generation, 
consider using services like **Chainlink VRF** (Verifiable Random Function).
