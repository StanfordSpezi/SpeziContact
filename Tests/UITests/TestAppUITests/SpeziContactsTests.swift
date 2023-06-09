//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import XCTest


final class ContactsTests: XCTestCase {
    func testContactsView() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertEqual(app.staticTexts.matching(identifier: "Paul Schmiedmayer").count, 2)
        XCTAssertEqual(app.staticTexts.matching(identifier: "A Title").count, 2)
        XCTAssertEqual(app.staticTexts.matching(identifier: "Stanford University").count, 2)
        
        let labelPredicate = NSPredicate(format: "label CONTAINS[c] %@", "This is a description")
        XCTAssert(app.staticTexts.element(matching: labelPredicate).exists)
        
        XCTAssertEqual(app.buttons.matching(identifier: "Call").count, 4)
        app.buttons.matching(identifier: "Call").element(boundBy: 0).tap()
        app.alerts["Call"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssertEqual(app.buttons.matching(identifier: "Text").count, 2)
        app.buttons.matching(identifier: "Text").element(boundBy: 0).tap()
        if #available(iOS 17.0, *) {
            let messages = XCUIApplication(bundleIdentifier: "com.apple.MobileSMS")
            XCTAssert(messages.wait(for: .runningForeground, timeout: 2))
            app.activate()
            XCTAssert(app.wait(for: .runningForeground, timeout: 2))
        } else {
            app.alerts["Text"].scrollViews.otherElements.buttons["Ok"].tap()
        }
        
        sleep(2)
        app.swipeUp()
        
        XCTAssertEqual(app.buttons.matching(identifier: "Email").count, 2)
        app.buttons.matching(identifier: "Email").element(boundBy: 0).tap()
        app.alerts["Email"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssertEqual(app.buttons.matching(identifier: "Cloud").count, 2)
        app.buttons.matching(identifier: "Cloud").element(boundBy: 0).tap()
        
        XCTAssertEqual(app.buttons.matching(identifier: "Address, 450 Serra Mall\nStanford CA 94305\nUSA").count, 2)
        app.buttons.matching(identifier: "Address, 450 Serra Mall\nStanford CA 94305\nUSA").element(boundBy: 0).tap()
        let maps = XCUIApplication(bundleIdentifier: "com.apple.Maps")
        XCTAssert(maps.wait(for: .runningForeground, timeout: 2))
    }
}
