//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import XCTest


final class ContactsTests: XCTestCase {
    @MainActor
    func testContactsView() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 2.0))


        XCTAssertTrue(app.staticTexts["Contact: Jane Stanford"].waitForExistence(timeout: 2.0))
        XCTAssertTrue(app.staticTexts["A Title at Stanford University"].exists)
        
        let labelPredicate = NSPredicate(format: "label CONTAINS[c] %@", "This is a description")
        XCTAssert(app.staticTexts.element(matching: labelPredicate).exists)
        
        XCTAssertEqual(app.buttons.matching(identifier: "Call").count, 3)
#if os(iOS)
        app.buttons.matching(identifier: "Call").element(boundBy: 0).tap()
        app.alerts["Call"].scrollViews.otherElements.buttons["Ok"].tap()
#endif
        XCTAssertEqual(app.buttons.matching(identifier: "Text").count, 2)
        app.buttons.matching(identifier: "Text").element(boundBy: 0).tap()
        if app.alerts["Text"].scrollViews.otherElements.buttons["Ok"].waitForExistence(timeout: 5) {
            app.alerts["Text"].scrollViews.otherElements.buttons["Ok"].tap()
        } else {
            let messages = XCUIApplication(bundleIdentifier: "com.apple.MobileSMS")
            XCTAssert(messages.wait(for: .runningForeground, timeout: 2))
            app.activate()
            XCTAssert(app.wait(for: .runningForeground, timeout: 2))
        }
        
        sleep(2)
#if os(iOS)
        app.swipeUp()
#endif

        XCTAssertEqual(app.buttons.matching(identifier: "Email").count, 2)
        app.buttons.matching(identifier: "Email").element(boundBy: 0).tap()
        app.alerts["Email"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssertEqual(app.buttons.matching(identifier: "Cloud").count, 1)
        app.buttons.matching(identifier: "Cloud").element(boundBy: 0).tap()

        let predicate = NSPredicate(format: "label BEGINSWITH 'Address: 450 Serra Mall'")
        XCTAssertEqual(app.buttons.matching(predicate).count, 2)
        app.buttons.matching(predicate).element(boundBy: 0).tap()
        let maps = XCUIApplication(bundleIdentifier: "com.apple.Maps")
        XCTAssert(maps.wait(for: .runningForeground, timeout: 2))
    }

    @MainActor
    func testContactsViewWithLargestTextSize() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXXL"]
        app.launch()

        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 2.0))

        let name = app.staticTexts["Contact: Jane Stanford"]
        let subtitle = app.staticTexts["A Title at Stanford University"]
        let description = app.staticTexts.element(matching: NSPredicate(format: "label CONTAINS[c] %@", "This is a description"))
        XCTAssertTrue(name.waitForExistence(timeout: 2.0))
        XCTAssertTrue(subtitle.exists)
        XCTAssertTrue(description.exists)

        // The header must grow with the text instead of overlapping the description below it.
        XCTAssertLessThanOrEqual(name.frame.maxY, subtitle.frame.minY + 1)
        XCTAssertLessThanOrEqual(subtitle.frame.maxY, description.frame.minY + 1)
    }
}
