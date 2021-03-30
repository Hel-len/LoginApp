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
        
        setGradientBackground()
        logInButton.layer.cornerRadius = 10
        logInButton.layer.shadowRadius = 10
        logInButton.layer.shadowOffset = .zero
        logInButton.layer.shadowOpacity = 0.5
        logInButton.layer.shadowColor = UIColor.black.cgColor
        logInButton.layer.shadowPath = UIBezierPath(rect: logInButton.bounds).cgPath
        
        nameTextField.layer.shadowRadius = 10
        nameTextField.layer.shadowOffset = .zero
        nameTextField.layer.shadowOpacity = 0.5
        nameTextField.layer.shadowColor = UIColor.black.cgColor
        nameTextField.layer.shadowPath = UIBezierPath(rect: nameTextField.bounds).cgPath
        
        passwordTextField.layer.shadowRadius = 10
        passwordTextField.layer.shadowOffset = .zero
        passwordTextField.layer.shadowOpacity = 0.5
        passwordTextField.layer.shadowColor = UIColor.black.cgColor
        passwordTextField.layer.shadowPath = UIBezierPath(rect: passwordTextField.bounds).cgPath
        
        nameTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        if nameTextField.text == login {
            if passwordTextField.text == password {
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
    
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 166.0/255.0, green: 59.0/255.0, blue: 227.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 59.0/255.0, green: 138.0/255.0, blue: 227.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Oops! Something's go wrong!", message: "Check your name and password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
}




