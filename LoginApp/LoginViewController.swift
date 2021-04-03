//
//  ViewController.swift
//  LoginApp
//
//  Created by Елена Дранкина on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = nameTextField.text
    }
    
    @IBAction func logInPressed() {
        if nameTextField.text != login || passwordTextField.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(login) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }

}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}



