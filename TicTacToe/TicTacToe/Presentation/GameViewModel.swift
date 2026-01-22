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
    
    // Converts domain status into UI text.
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
    
    // Single place to map domain players to UI symbols.
    private static func playerSymbol(_ player: Player) -> String {
        switch player {
        case .x: return "X"
        case .o: return "O"
        }
    }
    
    func play(row: Int, column: Int) throws {
        try session.play(at: Position(row: row, column: column))
        // Refresh UI from the latest session snapshot.
        let state = session.state()
        cells = state.cells
        statusText = GameViewModel.statusText(from: state.status)
    }
    
    func reset() {
        session.reset()
        // Refresh UI from a new game.
        let state = session.state()
        cells = state.cells
        statusText = GameViewModel.statusText(from: state.status)
    }
}
