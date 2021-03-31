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
        
        setGradientBackground()
        shadowTextFieldDrowing(textFieldToDrowShadow: nameTextField)
        shadowTextFieldDrowing(textFieldToDrowShadow: passwordTextField)
        shadowButtonDrowing(buttonToDrowShadow: logInButton)
        
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
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 166.0/255.0, green: 59.0/255.0, blue: 227.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 59.0/255.0, green: 138.0/255.0, blue: 227.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func shadowTextFieldDrowing(textFieldToDrowShadow: UITextField) {
        textFieldToDrowShadow.layer.cornerRadius = 10
        textFieldToDrowShadow.layer.shadowRadius = 10
        textFieldToDrowShadow.layer.shadowOffset = .zero
        textFieldToDrowShadow.layer.shadowOpacity = 0.5
        textFieldToDrowShadow.layer.shadowColor = UIColor.black.cgColor
        textFieldToDrowShadow.layer.shadowPath = UIBezierPath(rect: textFieldToDrowShadow.bounds).cgPath
    }
    
    func shadowButtonDrowing(buttonToDrowShadow: UIButton) {
        buttonToDrowShadow.layer.cornerRadius = 10
        buttonToDrowShadow.layer.shadowRadius = 10
        buttonToDrowShadow.layer.shadowOffset = .zero
        buttonToDrowShadow.layer.shadowOpacity = 0.5
        buttonToDrowShadow.layer.shadowColor = UIColor.black.cgColor
        buttonToDrowShadow.layer.shadowPath = UIBezierPath(rect: buttonToDrowShadow.bounds).cgPath
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




