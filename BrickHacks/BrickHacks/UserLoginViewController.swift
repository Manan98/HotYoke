//
//  UserLoginViewController.swift
//  BrickHacks
//
//  Created by Mac2 on 2/12/17.
//  Copyright © 2017 org.cuappdev.project2. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {

    
    var usernameLabel: UILabel!
    var passwordLabel: UILabel!
    var providerLabel: UILabel!
    
    
    var signinButton: UIButton!
    
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var providerTextField: UITextField!
    
    
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
        //providerLabel = UILabel(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        providerLabel = UILabel(frame: CGRect(x: labelLeftEdgeInset, y: passwordLabel.frame.origin.y + passwordLabel.frame.height + textFieldSeparator, width: textFieldLabelWidth + 50, height: textFieldHeight))
        
        
        
        usernameLabel.text = "Username: "
        //usernameLabel.textColor = .white
        
        passwordLabel.text = "Password: "
        //passwordLabel.textColor = .white
        
        providerLabel.text = "Provider: "
        
        
        usernameTextField = UITextField(frame: CGRect(x: usernameLabel.frame.origin.x + usernameLabel.frame.width, y: usernameLabel.frame.origin.y, width: textFieldWidth, height: textFieldHeight))
        usernameTextField.borderStyle = .roundedRect
        
        passwordTextField = UITextField(frame: CGRect(x: passwordLabel.frame.origin.x + passwordLabel.frame.width, y: passwordLabel.frame.origin.y, width: textFieldWidth, height: textFieldHeight))
        passwordTextField.borderStyle = .roundedRect
        
        providerTextField = UITextField(frame: CGRect(x: providerLabel.frame.origin.x + providerLabel.frame.width, y: providerLabel.frame.origin.y, width: textFieldWidth, height: textFieldHeight))
        providerTextField.borderStyle = .roundedRect
        
        /// Create add login button
        signinButton = UIButton(frame: CGRect(x: 0, y: providerLabel.frame.origin.y + providerLabel.frame.height + textFieldSeparator * 2.0, width: view.frame.width / 2.0, height: 50))
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
        view.addSubview(providerLabel)
        view.addSubview(providerTextField)
    }
    
   
    
    func login() {
        //go to meterview
        
        passwordTextField.resignFirstResponder()
        providerTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        
        
        
        if let uname = usernameTextField.text, let pss = passwordTextField.text, let prov = providerTextField.text {
            
            let destination = MeterViewController()
            destination.count = 11
            destination.username = uname
            destination.password = pss
            destination.provider = prov            
            
            navigationController?.pushViewController(destination, animated: true)
            
            
            //let destination = MeterViewController(nibName: "MeterViewController", bundle: Bundle.main)!
            //destination.myInformation = self.myInformation
            //self.showViewController(destination,sender: self)
            
            
            //navigationController?.pushViewController(MeterViewController(nibName: "MeterViewController", bundle: Bundle.main, username: uname, password: pss, provider: prov), animated: true)
        }
        
    }
    
}
