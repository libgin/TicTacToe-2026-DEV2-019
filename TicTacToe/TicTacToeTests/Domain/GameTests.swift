//
//  GameTests.swift
//  TicTacToe
//
//  Created by Victor on 1/20/26.
//

import XCTest
@testable import TicTacToe

  final class GameTests: XCTestCase {
      func test_newGameStartsWithX() {
          let game = Game()
          XCTAssertEqual(game.status, .inProgress(next: .x))
      }
  }
