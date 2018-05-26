//
//  LoginViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
    let loginViewContainer: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor.white
        
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColorFromHex(hexValue: 0xBAD7DF)
        view.addSubview(loginViewContainer)
        setupConstraints()
    }
    
    func setupConstraints() {
        loginViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        loginViewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


// MARK: Setup Interface
extension LoginViewController {

    

}
