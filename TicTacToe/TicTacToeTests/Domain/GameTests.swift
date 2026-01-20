//
//  GameTests.swift
//  TicTacToe
//
//  Created by Victor on 1/20/26.
//

import XCTest
@testable import TicTacToe

final class GameTests: XCTestCase {
    
    func test_newGameStartsWithX() {
        let game = Game()
        XCTAssertEqual(game.status, .inProgress(next: .x))
    }
    
    func test_playersAlternateTurns() throws {
        
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0))
        XCTAssertEqual(game.status, .inProgress(next: .o))
        
        try game.play(at: Position(row: 1, column: 0))
        XCTAssertEqual(game.status, .inProgress(next: .x))
    }
    
    func test_cannotPlayOnOccupiedPosition() throws {
        
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0))
        XCTAssertThrowsError(try game.play(at: Position(row: 0, column: 0)))
    }
}
