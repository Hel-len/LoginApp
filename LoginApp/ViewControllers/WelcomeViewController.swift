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
    @IBOutlet var randomImageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user.person.fullName)"
        
        Helper().setGradientBackground(view: self)
        Helper().shadowButtonDrowing(buttonToDrowShadow: logOutButton)
        randomImageView.layer.cornerRadius = 25
        getRandomImage()
    }
    
    func getRandomImage() {
        var imagesStack: [UIImage] = []
        for i in 1...4 {
            if let image = UIImage(named: "welcome\(i)") {
                imagesStack.append(image)
            }
            randomImageView.image = imagesStack[Int.random(in: 0...imagesStack.count - 1)]
        }
    }
}
