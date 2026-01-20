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
}

struct Game: Equatable {
    private(set) var status: GameStatus
    private var moves: [Position: Player]
    
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
            status = .inProgress(next: next.next)
        }
    }
}
