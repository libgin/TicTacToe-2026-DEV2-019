//
//  TicTacToeUITestsLaunchTests.swift
//  TicTacToeUITests
//
//  Created by Victor on 1/19/26.
//

import XCTest

final class TicTacToeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        throw XCTSkip("Default launch test")
    }
}
