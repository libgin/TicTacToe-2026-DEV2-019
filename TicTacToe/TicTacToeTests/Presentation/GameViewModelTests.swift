//
//  GameViewModelTests.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import XCTest
@testable import TicTacToe

@MainActor
final class GameViewModelTests: XCTestCase {
    func test_initialStateShowsNextPlayerAndEmptyBoard() {
        let viewModel = GameViewModel()
        
        XCTAssertEqual(viewModel.statusText, "Next: X")
        XCTAssertEqual(viewModel.cells.count, 3)
        XCTAssertTrue(viewModel.cells.allSatisfy { $0.count == 3 })
        XCTAssertTrue(viewModel.cells.flatMap { $0 }.allSatisfy { $0 == nil })
    }
}
