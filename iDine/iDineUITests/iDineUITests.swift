//
//  iDineUITests.swift
//  iDineUITests
//
//  Created by Eugene Berezin on 8/16/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import XCTest

class iDineUITests: XCTestCase {
    
    private let app = XCUIApplication()
 
    override func setUpWithError() throws {
        
        app.launch()
        
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMakeMapleFrenchToastOrder() {
        let mapleFrenchToast = app.collectionViews.cells.buttons["Maple French Toast, $6, G, V"]
        let title = app.navigationBars["Maple French Toast"].staticTexts["Maple French Toast"]
        let orderTab = XCUIApplication().tabBars["Tab Bar"].buttons["Order"]
        let expectedOrder = XCUIApplication().collectionViews.staticTexts["Maple French Toast"]
        let orderThis = app.buttons["Order This"]
        
        MenuPageModel.tapOnFrenchToast()
        
        XCTAssertTrue(title.waitForExistence(timeout: 15))
        
        OrderPageModel.tapOrderThis()
        
        orderTab.tap()
        
        XCTAssertTrue(expectedOrder.waitForExistence(timeout: 15))
                
    }
    

}
