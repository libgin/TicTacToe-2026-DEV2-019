//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Victor on 1/21/26.
//

import Foundation
import Combine

@MainActor
final class GameViewModel: ObservableObject {
    @Published private(set) var statusText: String
    @Published private(set) var cells: [[Player?]]
    
    private var session: GameSession
    
    init(session: GameSession = GameSession()) {
        self.session = session
        let state = session.state()
        self.cells = state.cells
        self.statusText = GameViewModel.statusText(from: state.status)
    }
    
    private static func statusText(from status: GameStatus) -> String {
        switch status {
        case .inProgress(let next):
            return "Next: \(playerSymbol(next))"
        case .win(let player):
            return "Winner: \(playerSymbol(player))"
        case .draw:
            return "Draw"
        }
    }
    
    private static func playerSymbol(_ player: Player) -> String {
        switch player {
        case .x: return "X"
        case .o: return "O"
        }
    }
}
