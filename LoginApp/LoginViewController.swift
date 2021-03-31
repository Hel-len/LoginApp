//
//  ViewController.swift
//  LoginApp
//
//  Created by Елена Дранкина on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    private let login = "User"
    private let password = "admin1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Helper().setGradientBackground(view: self)
        Helper().shadowButtonDrowing(buttonToDrowShadow: logInButton)
        Helper().shadowTextFieldDrowing(textFieldToDrowShadow: nameTextField)
        Helper().shadowTextFieldDrowing(textFieldToDrowShadow: passwordTextField)
        
        nameTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        nameTextField.tag = 0
        nameTextField.returnKeyType = .next
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .done
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nameTextField.text == login {
            if passwordTextField.text == password {
                guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
                welcomeVC.name = nameTextField.text
            } else {
                alert()
                passwordTextField.text = ""
            }
        } else {
            alert()
            passwordTextField.text = ""
            nameTextField.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgetNameButtonPushed() {
        let alert = UIAlertController(title: "Your name is:", message: login, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func forgetPasswordButtonPushed() {
        let alert = UIAlertController(title: "Your password is:", message: password, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func alert() {
        let alert = UIAlertController(title: "Oops! Something went wrong!", message: "Check your name and password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            return true;
        }
        return false
    }
}




