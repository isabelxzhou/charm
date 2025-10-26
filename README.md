# Charm Card Game

A card game built in Lisp with a beautiful HTML GUI.

## Game Overview

Charm is a card game where each player receives 6 cards with:
- **Numbers**: 1 through 6
- **Colors**: Red, Orange, Yellow, Green, Blue, and Violet

The game generates a deck of 36 unique cards (6 numbers × 6 colors) and deals them randomly to players.

## Features

- Deck of 36 cards (6 numbers × 6 colors)
- Random card dealing
- HTML-based GUI with color-coded cards
- Supports multiple players (default: 4 players)
- Beautiful visual representation of hands

## Getting Started

### Prerequisites

- A Common Lisp implementation (SBCL, CCL, or CLISP recommended)

### Installation

1. Clone or download this repository
2. Ensure you have a Common Lisp interpreter installed

### Running the Game

```bash
sbcl --load main.lisp
```

Or with CLISP:
```bash
clisp main.lisp
```

### Opening the GUI

After running the game, a file called `game.html` will be generated. Simply open it in your web browser to see the beautiful card interface!

## Project Structure

```
charm/
├── main.lisp      # Entry point and game runner
├── game.lisp      # Core game logic (cards, deck, dealing)
├── gui.lisp       # GUI generation (HTML interface)
└── README.md      # This file
```

## How It Works

1. **Card Creation**: Each card has a number (1-6) and a color
2. **Deck Generation**: Creates all 36 possible card combinations
3. **Dealing**: Randomly shuffles and deals 6 cards to each player
4. **Display**: Generates an HTML file showing each player's hand with color-coded cards

## Card Colors

- Red
- Orange
- Yellow
- Green
- Blue
- Violet

## Next Steps

You can extend this game by adding:
- Game rules and turn mechanics
- Player interaction
- Card playing logic
- Scoring system
- Multiplayer networking

## License

Feel free to use and modify this code for your own projects!

