//
//  iDineUITestsExampleLaunchTests.swift
//  iDineUITestsExample
//
//  Created by Eugene Berezin on 8/23/23.
//  Copyright © 2023 Eugene Berezin. All rights reserved.
//

import XCTest

final class iDineUITestsExampleLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
