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

        MenuPageModel.tapOnFrenchToast()
        
        XCTAssertTrue(OrderPageModel.NavBar.title.waitForExistence(timeout: 15))
        
        OrderPageModel.tapOrderThis()
        
        AppPageModel.tapOrder()
        
        assertTheCorrectOrderTrue(element: OrderModel.Cells.mapleFrenchToast)
                
    }
    
    func testMakePancakesOrder() {
        let pancakes = XCUIApplication().collectionViews.buttons["Stack-o-Pancakes, $8, D, G, V"]
        let pancakesTitle = XCUIApplication().navigationBars["Stack-o-Pancakes"].staticTexts["Stack-o-Pancakes"]
        let pancakesOrder = XCUIApplication().collectionViews.staticTexts["Stack-o-Pancakes"]
        
        
        pancakes.tap()
        XCTAssertTrue(pancakesTitle.waitForExistence(timeout: 15))
        OrderPageModel.tapOrderThis()
        AppPageModel.tapOrder()
        assertTheCorrectOrderTrue(element: pancakesOrder)
    }
    

}

extension XCTestCase {
    func assertTheCorrectOrderTrue(element: XCUIElement) {
        XCTAssertTrue(element.waitForExistence(timeout: 15))
    }
}
