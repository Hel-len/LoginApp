//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Елена Дранкина on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
        welcomeLabel.text = "Welcome, " + name + "!"
        
        logOutButton.layer.cornerRadius = 10
        logOutButton.layer.shadowRadius = 10
        logOutButton.layer.shadowOffset = .zero
        logOutButton.layer.shadowOpacity = 0.5
        logOutButton.layer.shadowColor = UIColor.black.cgColor
        logOutButton.layer.shadowPath = UIBezierPath(rect: logOutButton.bounds).cgPath
        
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
}
