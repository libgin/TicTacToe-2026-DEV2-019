//
//  GameState.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import Foundation

struct GameState: Equatable {
    let status: GameStatus
    let size: Int
    let cells: [[Player?]]
}
