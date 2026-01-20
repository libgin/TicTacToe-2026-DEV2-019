//
//  Game.swift
//  TicTacToe
//
//  Created by Victor on 1/20/26.
//

import Foundation

enum Player: Equatable {
    case x
}

enum GameStatus: Equatable {
    case inProgress(next: Player)
}

struct Game: Equatable {
    let status: GameStatus
    
    init() {
        status = .inProgress(next: .x)
    }
}
