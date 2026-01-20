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

struct Position: Equatable {
    let row: Int
    let column: Int
}

enum GameStatus: Equatable {
    case inProgress(next: Player)
}

struct Game: Equatable {
    private(set) var status: GameStatus
    
    init() {
        status = .inProgress(next: .x)
    }
    
    mutating func play(at position: Position) throws {
        _ = position
        if case let .inProgress(next) = status {
            status = .inProgress(next: next.next)
        }
    }
}
