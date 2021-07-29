//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Елена Дранкина on 30.03.2021.
//

import UIKit

class InformationVC:UIViewController {
    
    var user: User!
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabelView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabelView.text = user.person.fullName
        userImageView.image = UIImage(named: user.person.image)
    }
}
