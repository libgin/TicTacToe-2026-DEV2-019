//
//  Board.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import Foundation

struct Board: Equatable {
    let size: Int
    private var moves: [Position: Player]
    
    init(size: Int) {
        self.size = size
        self.moves = [:]
    }
    
    var isFull: Bool {
        moves.count == size * size
    }
    
    func player(at position: Position) -> Player? {
        moves[position]
    }
    
    mutating func place(_ player: Player, at position: Position) throws {
        if moves[position] != nil {
            throw GameError.positionAlreadyPlayed
        }
        moves[position] = player
    }
}
