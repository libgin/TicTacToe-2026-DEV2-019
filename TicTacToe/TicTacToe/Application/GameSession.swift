//
//  GameSession.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import Foundation

final class GameSession {
    private var game = Game()
    
    func state() -> GameState {
        // Map the domain board to a UI snapshot.
        let size = game.size
        let cells = (0..<size).map { row in
            (0..<size).map { column in
                game.player(at: Position(row: row, column: column))
            }
        }
        return GameState(status: game.status, size: size, cells: cells)
    }
    
    func play(at position: Position) throws {
        try game.play(at: position)
    }
    
    func reset() {
        game = Game()
    }
}
