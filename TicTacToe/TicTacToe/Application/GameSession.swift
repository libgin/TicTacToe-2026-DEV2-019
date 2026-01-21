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
        let size = game.size
        let cells = (0..<size).map { row in
            (0..<size).map { column in
                game.player(at: Position(row: row, column: column))
            }
        }
        return GameState(status: game.status, size: size, cells: cells)
    }
}
