//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Victor on 1/19/26.
//

import XCTest

final class TicTacToeUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func test_playingUpdatesCellAndStatus() {
        let status = app.staticTexts["statusLabel"]
        XCTAssertTrue(status.waitForExistence(timeout: 5))
        XCTAssertEqual(status.label, "Next: X")

        let cell = app.buttons["cell_0_0"]
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        cell.tap()

        XCTAssertTrue(waitFor(label: "X", element: cell))
        XCTAssertTrue(waitFor(label: "Next: O", element: status))
        XCTAssertFalse(cell.isEnabled)
    }

    func test_resetClearsBoard() {
        let cell = app.buttons["cell_0_0"]
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        cell.tap()

        let reset = app.buttons["resetButton"]
        XCTAssertTrue(reset.waitForExistence(timeout: 5))
        if !reset.isHittable {
            app.swipeUp()
        }
        reset.tap()

        XCTAssertTrue(waitFor(label: "Empty", element: cell))
        XCTAssertTrue(waitFor(label: "Next: X", element: app.staticTexts["statusLabel"]))
        XCTAssertTrue(cell.isEnabled)
    }

    private func waitFor(label: String, element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "label == %@", label)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        return XCTWaiter().wait(for: [expectation], timeout: 5) == .completed
    }
}
