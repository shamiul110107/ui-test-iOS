//
//  ViewController.swift
//  UITest
//
//  Created by Bismillah on 5/4/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var continueGuestButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccsibilityIdentifire()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailWarningLabel.text = ""
        passwordWarningLabel.text = ""
    }
    
    fileprivate func setupAccsibilityIdentifire() {
        submitButton.accessibilityIdentifier = identifire.submitBtn.rawValue
        continueGuestButton.accessibilityIdentifier = identifire.guestBtn.rawValue
        loginTitle.accessibilityIdentifier = identifire.loginTitle.rawValue
        emailTextField.accessibilityIdentifier = identifire.emailTxtField.rawValue
        passwordTextField.accessibilityIdentifier = identifire.passwordTxtField.rawValue
        emailWarningLabel.accessibilityIdentifier = identifire.emailWarningLabel.rawValue
        passwordWarningLabel.accessibilityIdentifier = identifire.passwordWarningLabel.rawValue
    }
    
    
    private func checkEmail(text: String) {
        if text.isValidEmail || text.isEmpty {
            emailWarningLabel.text = ""
        } else {
            emailWarningLabel.text = "Invalid Email"
        }
    }
    
    private func checkPassword(text: String) {
        if text.isValidPassword || text.isEmpty {
            passwordWarningLabel.text = ""
        } else {
            passwordWarningLabel.text = "Password is Invalid"
        }
    }
    
    private func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        print(emailTextField.text!.isValidEmail, passwordTextField.text!.isValidPassword)
        if emailTextField.text!.isValidEmail && passwordTextField.text!.isValidPassword {
            navigateToHome()
        }
    }
    
    @IBAction func continueGuestButtonAction(_ sender: Any) {
        navigateToHome()
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        if textField == emailTextField {
            checkEmail(text: newString)
        } else if textField == passwordTextField {
            checkPassword(text: newString)
        }
        return true
    }
}

// Very basic validation.
