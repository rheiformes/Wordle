# Wordle Clone

A Swift implementation of the popular Wordle game, designed to practice MVC (Model-View-Controller) architecture concepts.

## Overview

This project is a clone of the New York Times Wordle game, built using Swift and MVC principles. The game challenges players to guess a five-letter word within a limited number of attempts, providing hints after each guess to help narrow down the correct answer.

## Features

- **MVC Architecture**: The project is structured following the MVC pattern, separating the application's data, user interface, and control logic for better maintainability.
- **User Interface**: A simple, intuitive interface that displays the game state, user input, and feedback, following the NYT Wordle format.
- **Gameplay Mechanics**: Following Wordle pattern, players have six attempts to guess a randomly selected five-letter word. Feedback is provided through color-coded hints, indicating correct letters in the correct positions and correct letters in incorrect positions.
- **Demo Video**: [A demonstration video is available to showcase the gameplay and features here](https://youtu.be/tmYbgvpsxAU).

## Installation

To run this project locally, follow these steps:

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/rheiformes/Wordle.git
   ```
2. **Open in Xcode**: Open the project in Xcode.
3. **Build and Run**: Select your target device or simulator, then build and run the project.

## How to Play

1. Start the game and enter a five-letter word as your guess.
2. After each guess, receive feedback:
   - Green indicates a correct letter in the correct position.
   - Yellow indicates a correct letter in the wrong position.
   - Gray indicates an incorrect letter.
3. Continue guessing until you find the correct word or exhaust your attempts.

## Development

This project was developed as a learning exercise to understand MVC architecture and Swift programming. The codebase includes clearly separated components for the model (game logic), view (user interface), and controller (interaction logic).

## Acknowledgments

- Inspired by the original Wordle game by Josh Wardle, now owned by the New York Times.
