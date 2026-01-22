# TicTacToe (SwiftUI)

This repository contains a Tic Tac Toe kata built in SwiftUI.
The focus is on clean design, explicit rules, and showing the development process via TDD.

## Goal
- Implement the kata rules in Swift with a simple SwiftUI interface.
- Keep business rules isolated from UI.
- Demonstrate strict red/green/refactor in the Git history.

## What was done
- Implemented the full rule set (turn order, invalid moves, wins, draw).
- Built a dynamic 3x3 board UI with clear game status and reset.
- Added a small application layer to drive the game from the UI.
- Wrote unit tests at the Domain, Application, and ViewModel levels.

## Requirements
- macOS with Xcode 26.2+ (Swift 5)
- iOS 26.2 simulator/device (deployment target set by Xcode default)

## Run
1) Open `TicTacToe/TicTacToe.xcodeproj` in Xcode.
2) Select the `TicTacToe` scheme.
3) Run with `Cmd+R`.

## Tests
- Run all tests with `Cmd+U` in Xcode.

## CI
- GitHub Actions runs `xcodebuild test` on every push to `main`.
- The workflow creates a simulator on the runner and runs tests serially for stability.

## Coverage
Enable **Gather coverage data** in the Test scheme, run `Cmd+U`, then check **Coverage** in the Report navigator (`Cmd+9`).

## Architecture (high level)
- Domain: rules and entities (`Game`, `Board`, `Player`, `Position`, `GameStatus`).
- Application: orchestration (`GameSession`, `GameState`).
- Presentation: SwiftUI + ViewModel (`GameViewModel`, `ContentView`).

This keeps the rules independent from the UI and makes the core logic easy to test.

## TDD and Git History
I used a strict red/green/refactor flow while implementing the rules.
The commit history is intentionally granular so you can follow the reasoning step by step:
- `T` adds a failing test for a rule or scenario.
- `F` adds the smallest change to make the test pass.
- `R` cleans up the design without changing behavior.

This makes the evolution of the solution explicit rather than just showing a final result.

## Possible Improvements
- Improve UI polish (animations, colors, accessibility).
- Add clear error feedback for invalid moves.
- Make board size configurable beyond 3x3.
- Add CI checks (build/tests) and optional formatting/linting.
