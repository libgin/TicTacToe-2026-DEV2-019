//
//  Game.swift
//  TicTacToe
//
//  Created by Victor on 1/20/26.
//

import Foundation

enum Player: Equatable {
    case x
    case o
    
    var next: Player {
        self == .x ? .o : .x
    }
}

struct Position: Equatable, Hashable {
    let row: Int
    let column: Int
}

enum GameError: Error, Equatable {
    case positionAlreadyPlayed
}

enum GameStatus: Equatable {
    case inProgress(next: Player)
    case win(Player)
}

struct Game: Equatable {
    private(set) var status: GameStatus
    private var moves: [Position: Player]
    private let size = 3
    
    init() {
        status = .inProgress(next: .x)
        moves = [:]
    }
    
    mutating func play(at position: Position) throws {
        if moves[position] != nil {
            throw GameError.positionAlreadyPlayed
        }
        
        if case let .inProgress(next) = status {
            moves[position] = next
            if hasWinningRow(for: next) || hasWinningColumn(for: next) || hasWinningDiagonal(for: next) {
                status = .win(next)
            } else {
                status = .inProgress(next: next.next)
            }
        }
    }

    // Helpers to build winning lines and reuse a single completion check.
    private func hasWinningRow(for player: Player) -> Bool {
        for row in 0..<size {
            if isLineComplete(positions(inRow: row), for: player) {
                return true
            }
        }
        return false
    }
    
    private func hasWinningColumn(for player: Player) -> Bool {
        for column in 0..<size {
            if isLineComplete(positions(inColumn: column), for: player) {
                return true
            }
        }
        return false
    }
    
    private func hasWinningDiagonal(for player: Player) -> Bool {
        isLineComplete(positionsInPrimaryDiagonal(), for: player) || isLineComplete(positionsInSecondaryDiagonal(), for: player)
    }
    
    // A line is complete when every position is claimed by the same player.
    private func isLineComplete(_ positions: [Position], for player: Player) -> Bool {
        positions.allSatisfy { moves[$0] == player }
    }
    
    // Row positions: fixed row, varying columns.
    private func positions(inRow row: Int) -> [Position] {
        (0..<size).map { Position(row: row, column: $0) }
    }
    
    // Column positions: fixed column, varying rows.
    private func positions(inColumn column: Int) -> [Position] {
        (0..<size).map { Position(row: $0, column: column) }
    }
    
    // Primary diagonal: (0,0) -> (n-1,n-1).
    private func positionsInPrimaryDiagonal() -> [Position] {
        (0..<size).map { Position(row: $0, column: $0) }
    }
    
    // Secondary diagonal: (0,n-1) -> (n-1,0).
    private func positionsInSecondaryDiagonal() -> [Position] {
        (0..<size).map { Position(row: $0, column: size - 1 - $0) }
    }
}
