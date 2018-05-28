//
//  AuthenticationViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/27/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: Views
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Constants.Colors.signUpButtonBackgroundColor
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Constants.Colors.authenticationLogInButtonBackgroundColor
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Actions
    
    @objc func signUpButtonPressed() {
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true, completion: nil)

    }
    
    @objc func logInButtonPressed() {
        let logInViewController = LogInViewController()
        present(logInViewController, animated: true, completion: nil)
    }
    
}

// MARK: View Constraints
extension AuthenticationViewController {
    func setupViews() {
        view.backgroundColor = Constants.Colors.authenticationViewBackgroundColor
        
        setupSignUpButtonConstraints()
        setupLogInButtonConstraints()
    }
    
    func setupSignUpButtonConstraints() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
    }
    
    func setupLogInButtonConstraints() {
        view.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10).isActive = true
        
    }
}
