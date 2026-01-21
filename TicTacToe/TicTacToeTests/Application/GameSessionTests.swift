//
//  GameSessionTests.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import XCTest
@testable import TicTacToe

final class GameSessionTests: XCTestCase {
    func test_newSessionReturnsInitialState() {
        let session = GameSession()
        let state = session.state()
        
        XCTAssertEqual(state.status, .inProgress(next: .x))
        XCTAssertEqual(state.size, 3)
        XCTAssertEqual(state.cells.count, 3)
        XCTAssertTrue(state.cells.allSatisfy { $0.count == 3 })
        XCTAssertTrue(state.cells.flatMap { $0 }.allSatisfy { $0 == nil })
    }
}
