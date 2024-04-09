//
//  UITestUITests.swift
//  UITestUITests
//
//  Created by Bismillah on 5/4/2567 BE.
//

import XCTest

final class UITestUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoginFailed() {
        let loginTitle = app.staticTexts[identifire.loginTitle.rawValue]
        let emailTxtField = app.textFields[identifire.emailTxtField.rawValue]
        let passwordTxtField = app.textFields[identifire.passwordTxtField.rawValue]
        let submitBtn = app.buttons[identifire.submitBtn.rawValue]
        let emailWarningLabel = app.staticTexts[identifire.emailWarningLabel.rawValue]
        let passWarningLabel = app.staticTexts[identifire.passwordWarningLabel.rawValue]
        
        XCTAssertTrue(loginTitle.exists)
        XCTAssertTrue(emailTxtField.exists)
        XCTAssertTrue(passwordTxtField.exists)
        XCTAssertTrue(submitBtn.exists)
        
        emailTxtField.tap()
        // check error missing .com
        emailTxtField.typeText("abcgmail")
        XCTAssertTrue(emailWarningLabel.exists)
        XCTAssertEqual(emailWarningLabel.label, "Invalid Email")
        
        passwordTxtField.tap()
        //error
        passwordTxtField.typeText("Aa12")
        XCTAssertTrue(passWarningLabel.exists)
        XCTAssertEqual(passWarningLabel.label, "Password is Invalid")
    }
    
    func testLoginSuccess() {
        
        let loginTitle = app.staticTexts[identifire.loginTitle.rawValue]
        let emailTxtField = app.textFields[identifire.emailTxtField.rawValue]
        let passwordTxtField = app.textFields[identifire.passwordTxtField.rawValue]
        let submitBtn = app.buttons[identifire.submitBtn.rawValue]
        let emailWarningLabel = app.staticTexts[identifire.emailWarningLabel.rawValue]
        let passWarningLabel = app.staticTexts[identifire.passwordWarningLabel.rawValue]
        
        XCTAssertTrue(loginTitle.exists)
        XCTAssertTrue(emailTxtField.exists)
        XCTAssertTrue(passwordTxtField.exists)
        XCTAssertTrue(submitBtn.exists)
        
        emailTxtField.tap()
        emailTxtField.typeText("abc@gmail.com")
        XCTAssertFalse(emailWarningLabel.exists)
        
        passwordTxtField.tap()
        passwordTxtField.typeText("Aa1233@8")
        XCTAssertFalse(passWarningLabel.exists)
        submitBtn.tap()
        
        let table = app.tables[homeidentifire.tableView.rawValue]
        XCTAssertTrue(table.exists)
        
    }
    
    func testHomeView() {
        let guestBtn = app.buttons[identifire.guestBtn.rawValue]
        XCTAssertTrue(guestBtn.exists)
        guestBtn.tap()
        
        let table = app.tables[homeidentifire.tableView.rawValue]
        XCTAssertTrue(table.exists)
        XCTAssertEqual(table.cells.count, 20)
        
        let firstCell = table.cells.staticTexts["indexpath 0"]
        XCTAssertTrue(firstCell.exists)
        
        let cellToScrollTo = table.cells.staticTexts["indexpath 19"]
        XCTAssertTrue(cellToScrollTo.exists, "Cell should exist in the table view")
        
        measure(metrics: [XCTOSSignpostMetric.scrollingAndDecelerationMetric]) {
            app.swipeUp()
            app.swipeDown()
        }
    }
}
