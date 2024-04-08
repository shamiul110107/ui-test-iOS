//
//  UITestUITests.swift
//  UITestUITests
//
//  Created by Bismillah on 5/4/2567 BE.
//

import XCTest

final class UITestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoginFailed() {
        let app = XCUIApplication()
        app.launch()
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
        
        passwordTxtField.tap()
        //error
        passwordTxtField.typeText("Aa12")
        XCTAssertTrue(passWarningLabel.exists)
    }
    
    func testLoginSuccess() {
        let app = XCUIApplication()
        app.launch()
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
        XCTAssertEqual(table.cells.count, 10)
        
        let firstCell = table.cells.staticTexts["indexpath 9"]
        XCTAssertTrue(firstCell.exists)
    }
}
