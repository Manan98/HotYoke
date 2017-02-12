//
//  ViewController.swift
//  BrickHacks
//
//  Created by Mac2 on 2/11/17.
//  Copyright © 2017 org.cuappdev.project2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var providerButton: UIButton!
    var userButton: UIButton!
    var titleLabel: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        providerButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.4, width: view.frame.width / 2.0, height: 50))
        providerButton.center = CGPoint(x: view.center.x, y: providerButton.center.y-20)
        //providerButton.setTitle("Provider", for: .normal)
        providerButton.setTitle("Provider", for: .normal)
        //providerButton.currentTitle?.write(to: "Provider")
        
        providerButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        providerButton.setTitleColor(.lightGray, for: .highlighted)
        providerButton.addTarget(self, action: #selector(providerButtonWasPressed), for: .touchUpInside)
        providerButton.titleLabel!.font = UIFont(name: "Consolas", size: 20)
        providerButton.titleLabel!.adjustsFontSizeToFitWidth = true
        //providerButton.frame = CGRect(x: providerButton.frame.minX, y: providerButton.frame.minY, width: providerButton.frame.width*2.0, height: providerButton.frame.height*2.0)
        //providerButton.center = CGPoint(x: view.center.x, y: providerButton.center.y*0.5)
        
        
        userButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.5, width: view.frame.width / 2.0, height: 50))
        userButton.center = CGPoint(x: view.center.x, y: userButton.center.y)
        userButton.setTitle("User", for: .normal)
        userButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        userButton.setTitleColor(.lightGray, for: .highlighted)
        userButton.addTarget(self, action: #selector(userButtonWasPressed), for: .touchUpInside)
        
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.1, width: view.frame.width / 2.0, height: 30))
        titleLabel.center = CGPoint(x: view.center.x, y: titleLabel.center.y)
        titleLabel.text = "Who Are You?"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        view.addSubview(userButton)
        view.addSubview(providerButton)
        
    }
    
    func userButtonWasPressed() {
        //go to user view
        navigationController?.pushViewController(UserViewController(), animated: true)
    }
    
    
    func providerButtonWasPressed() {
        //go to other view
        navigationController?.pushViewController(ProviderViewController(), animated: true)
    }


}

