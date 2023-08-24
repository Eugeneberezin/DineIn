//
//  MenuPageModel.swift
//  iDineUITests
//
//  Created by Eugene Berezin on 8/16/23.
//  Copyright © 2023 Eugene Berezin. All rights reserved.
//

import XCTest

class AppPageModel {
    enum TabBar {
        static let orderTab = XCUIApplication().tabBars["Tab Bar"].buttons["Order"]
    }
    
    static func tapOrder() {
        TabBar.orderTab.tap()
    }
}

class MenuPageModel {
    private let app = XCUIApplication()
    
    
    enum Cells {
        static let mapleFrenchToast = XCUIApplication().collectionViews.cells.buttons["Maple French Toast, $6, G, V"]
        
    }
    
    static func tapOnFrenchToast() {
        Cells.mapleFrenchToast.tap()
    }
}

class OrderPageModel {
    enum NavBar {
        static let title = XCUIApplication().navigationBars["Maple French Toast"].staticTexts["Maple French Toast"]
    
    }
    
    enum Buttons {
        static let orderThis = XCUIApplication().buttons["Order This"]
    }
    
    static func tapOrderThis() {
        Buttons.orderThis.tap()
    }
}

class OrderModel {
    enum Cells {
        static let mapleFrenchToast = XCUIApplication().collectionViews.staticTexts["Maple French Toast"]
    }
}
