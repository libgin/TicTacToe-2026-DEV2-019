//
//  ContentView.swift
//  TicTacToe
//
//  Created by Victor on 1/19/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(viewModel.statusText)
                    .font(.headline)
                    .accessibilityIdentifier("statusLabel")
                
                board
                
                Button("Reset") {
                    viewModel.reset()
                }
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("resetButton")
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
    
    private var board: some View {
        let size = viewModel.cells.count
        let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: size)
        let positions = (0..<size).flatMap { row in
            (0..<size).map { column in
                Position(row: row, column: column)
            }
        }

        return LazyVGrid(columns: columns, spacing: 8) {
            ForEach(positions, id: \.self) { position in
                let value = viewModel.cells[position.row][position.column]
                Button {
                    try? viewModel.play(row: position.row, column: position.column)
                } label: {
                    CellView(value: value)
                }
                .buttonStyle(.plain)
                .disabled(value != nil)
                .accessibilityIdentifier("cell_\(position.row)_\(position.column)")
                .accessibilityLabel(cellLabelText(for: value))
                .accessibilityValue(cellValueText(for: value))
            }
        }
    }

    private func cellLabelText(for value: Player?) -> String {
        let symbol = cellValueText(for: value)
        return symbol.isEmpty ? "Empty" : symbol
    }

    private func cellValueText(for value: Player?) -> String {
        switch value {
        case .x:
            return "X"
        case .o:
            return "O"
        case .none:
            return ""
        }
    }
}

private struct CellView: View {
    let value: Player?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.clear)
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primary.opacity(0.2), lineWidth: 2)

            Text(symbol)
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .frame(minHeight: 80)
        .aspectRatio(1, contentMode: .fit)
        .contentShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var symbol: String {
        switch value {
        case .x: return "X"
        case .o: return "O"
        case .none: return ""
        }
    }
}

#Preview {
    ContentView()
}
