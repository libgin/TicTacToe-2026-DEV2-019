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
            if hasWinningRow(for: next) {
                status = .win(next)
            } else {
                status = .inProgress(next: next.next)
            }
        }
        
        func hasWinningRow(for player: Player) -> Bool {
            for row in 0..<size {
                let isRowComplete = (0..<size).allSatisfy { column in
                    moves[Position(row: row, column: column)] == player
                }
                if isRowComplete {
                    return true
                }
            }
            return false
        }
    }
}
