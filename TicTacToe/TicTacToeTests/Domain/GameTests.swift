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
    
    func test_playerWinsWithThreeInRowHorizontal() throws {
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0)) // X
        try game.play(at: Position(row: 1, column: 0)) // O
        try game.play(at: Position(row: 0, column: 1)) // X
        try game.play(at: Position(row: 1, column: 1)) // O
        try game.play(at: Position(row: 0, column: 2)) // X wins
        
        XCTAssertEqual(game.status, .win(.x))
    }
    
    func test_playerWinsWithThreeInRowVertical() throws {
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0)) // X
        try game.play(at: Position(row: 0, column: 1)) // O
        try game.play(at: Position(row: 1, column: 0)) // X
        try game.play(at: Position(row: 0, column: 2)) // O
        try game.play(at: Position(row: 2, column: 0)) // X wins
        
        XCTAssertEqual(game.status, .win(.x))
    }
    
    func test_playerWinsWithThreeInRowDiagonal() throws {
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0)) // X
        try game.play(at: Position(row: 0, column: 1)) // O
        try game.play(at: Position(row: 1, column: 1)) // X
        try game.play(at: Position(row: 0, column: 2)) // O
        try game.play(at: Position(row: 2, column: 2)) // X wins
        
        XCTAssertEqual(game.status, .win(.x))
    }
    
    func test_gameIsDrawWhenBoardIsFullWithoutWinner() throws {
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0)) // X
        try game.play(at: Position(row: 0, column: 1)) // O
        try game.play(at: Position(row: 0, column: 2)) // X
        try game.play(at: Position(row: 1, column: 1)) // O
        try game.play(at: Position(row: 1, column: 0)) // X
        try game.play(at: Position(row: 1, column: 2)) // O
        try game.play(at: Position(row: 2, column: 1)) // X
        try game.play(at: Position(row: 2, column: 0)) // O
        try game.play(at: Position(row: 2, column: 2)) // X
        
        XCTAssertEqual(game.status, .draw)
    }
    
    func test_cannotPlayAfterGameIsOver() throws {
        var game = Game()
        
        try game.play(at: Position(row: 0, column: 0)) // X
        try game.play(at: Position(row: 1, column: 0)) // O
        try game.play(at: Position(row: 0, column: 1)) // X
        try game.play(at: Position(row: 1, column: 1)) // O
        try game.play(at: Position(row: 0, column: 2)) // X wins
        
        XCTAssertThrowsError(try game.play(at: Position(row: 2, column: 2)))
    }
}
