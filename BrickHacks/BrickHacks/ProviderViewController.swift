//
//  ProviderViewController.swift
//  BrickHacks
//
//  Created by Mac2 on 2/11/17.
//  Copyright © 2017 org.cuappdev.project2. All rights reserved.
//

import UIKit

class ProviderViewController: UIViewController {
    
    
    var usernameLabel: UILabel!
    var passwordLabel: UILabel!
    
    
    var signinButton: UIButton!
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        /// Basic constants for easily adjusting views
        let labelLeftEdgeInset: CGFloat = 20
        let textFieldTopInset: CGFloat = 100
        let textFieldHeight: CGFloat = 40
        let textFieldSeparator: CGFloat = 10
        let textFieldLabelWidth = view.frame.width * 0.2 - labelLeftEdgeInset
        let textFieldWidth = view.frame.width * 0.8 - labelLeftEdgeInset - 50
        
        usernameLabel = UILabel(frame: CGRect(x: labelLeftEdgeInset, y: textFieldTopInset, width: textFieldLabelWidth + 50, height: textFieldHeight))
        passwordLabel = UILabel(frame: CGRect(x: labelLeftEdgeInset, y: usernameLabel.frame.origin.y + usernameLabel.frame.height + textFieldSeparator, width: textFieldLabelWidth + 50, height: textFieldHeight))
       
        
        usernameLabel.text = "Username: "
        //usernameLabel.textColor = .white
        
        passwordLabel.text = "Password: "
        //passwordLabel.textColor = .white
        
        
        usernameTextField = UITextField(frame: CGRect(x: usernameLabel.frame.origin.x + usernameLabel.frame.width, y: usernameLabel.frame.origin.y, width: textFieldWidth, height: textFieldHeight))
        usernameTextField.borderStyle = .roundedRect
        
        passwordTextField = UITextField(frame: CGRect(x: passwordLabel.frame.origin.x + passwordLabel.frame.width, y: passwordLabel.frame.origin.y, width: textFieldWidth, height: textFieldHeight))
        passwordTextField.borderStyle = .roundedRect
        
        
        /// Create add student button
        signinButton = UIButton(frame: CGRect(x: 0, y: passwordLabel.frame.origin.y + passwordLabel.frame.height + textFieldSeparator * 2.0, width: view.frame.width / 2.0, height: 50))
        signinButton.center = CGPoint(x: view.center.x, y: signinButton.center.y)
        signinButton.setTitle("Login", for: .normal)
        signinButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        signinButton.setTitleColor(.lightGray, for: .highlighted)
        signinButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
        view.addSubview(signinButton)
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(usernameTextField)
        
    }
    
    func login() {
        //login
        print("LOGIN:")
        
        if let uname = usernameTextField.text, let pass = passwordTextField.text {
            let destination = LoggedinViewController()
            destination.username = uname
            destination.password = pass
           
            navigationController?.pushViewController(destination, animated: true)
            
        }
        
    }

}
