// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberGuessingGame {
    uint256 private randomNumber;
    address private winner;
    uint256 public prizePool;
    uint256 public constant REWARD = 1 ether; // Reward in ether (you can adjust this as per requirement)

    // The contract constructor is omitted, but you can initialize it directly when deploying

    // Constructor that initializes the random number and prize pool
    function startGame() public payable {
        // Randomly generate a number between 1 and 100
        randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 100 + 1;

        // Accept the prize pool deposit
        prizePool += msg.value;
    }

    // Guess function to make a guess
    function guessNumber(uint256 _guess) public {
        require(prizePool > 0, "No active game. Start a new game.");
        require(_guess >= 1 && _guess <= 100, "Guess must be between 1 and 100.");

        if (_guess == randomNumber) {
            // If the guess is correct, transfer the prize to the winner
            payable(msg.sender).transfer(REWARD);
            winner = msg.sender;
            prizePool = 0; // Reset the prize pool for a new game
        }
    }

    // Function to get the current prize pool balance
    function getPrizePool() public view returns (uint256) {
        return prizePool;
    }

    // Function to get the winner address
    function getWinner() public view returns (address) {
        return winner;
    }

    // A fallback function to handle any unexpected ether sent to the contract
    receive() external payable {}
}
