# TicTacToe (SwiftUI)

This repository contains a Tic Tac Toe kata built in SwiftUI.
I focused on clean design, explicit rules, and showing the development process via TDD.

## Goal
- Implement the kata rules in Swift with a simple SwiftUI interface.
- Keep business rules isolated from the UI.
- Make the red/green/refactor rhythm visible in the Git history.

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
- UI tests are executed in a separate workflow (manual trigger or nightly schedule at 02:00 UTC).

## Coverage
Run `Cmd+U`, then check **Coverage** in the Report navigator (`Cmd+9`).

## Architecture (high level)
- Domain: rules and entities (`Game`, `Board`, `Player`, `Position`, `GameStatus`).
- Application: orchestration (`GameSession`, `GameState`).
- Presentation: SwiftUI + ViewModel (`GameViewModel`, `ContentView`).

This keeps the rules independent from the UI and makes the core logic easy to test.

## Decisions
- Board as a separate entity: it keeps the game rules focused on state transitions, while the board is responsible for storage and placement rules.
- UI tests in a separate workflow: UI tests are useful but can be flaky on shared runners, so I keep them out of the main CI signal and run them manually or nightly.

## Notes
- I kept the UI intentionally simple to stay focused on the rules and test coverage.
- I chose small, frequent commits even when it meant more overhead, to make the TDD flow explicit.

## TDD and Git History
I used a strict red/green/refactor flow while implementing the rules.
The commit history is intentionally granular so you can follow the reasoning step by step:
- `T` adds a failing test for a rule or scenario.
- `F` adds the smallest change to make the test pass.
- `R` cleans up the design without changing behavior.
- `D` adds/cleans up the Doc README.

This makes the evolution of the solution explicit rather than just showing a final result.

## Possible Improvements
- Improve UI polish (animations, colors, accessibility).
- Add clear error feedback for invalid moves.
- Make board size configurable beyond 3x3.
- Add CI checks (build/tests) and optional formatting/linting.
