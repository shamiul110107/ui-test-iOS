//
//  AccsibilityId.swift
//  UITest
//
//  Created by Bismillah on 5/4/2567 BE.
//

import Foundation
typealias identifire = AccsibilityIdentifire.viewController
typealias homeidentifire = AccsibilityIdentifire.HomeController

struct AccsibilityIdentifire {
    enum viewController: String {
        case loginTitle = "viewController.loginTitle"
        case submitBtn = "viewController.submitBtn"
        case guestBtn = "viewController.guestBtn"
        case emailTxtField = "viewController.emailTxtField"
        case passwordTxtField = "viewController.passwordTxtField"
        case emailWarningLabel = "viewController.emailWarningLabel"
        case passwordWarningLabel = "viewController.passwordWarningLabel"
    }
    
    enum HomeController: String {
        case tableView = "HomeController.tableView"
    }

}
