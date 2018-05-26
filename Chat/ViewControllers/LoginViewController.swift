//
//  LoginViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    
    // MARK: Create Views
    let loginViewContainer: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 5
        loginView.layer.masksToBounds = true
        return loginView
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Settings.loginMainColor
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        
        return textField
        
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        return textField
    }()
    
    let nameEmailSeparatorView: UIView = {
        let separaterView = UIView()
        separaterView.backgroundColor = Settings.loginMainColor
        return separaterView
    }()
    
    let emailPasswordSeparatorView: UIView = {
        let separaterView = UIView()
        separaterView.backgroundColor = Settings.loginMainColor
        return separaterView
    }()
    
    
}


// MARK: Setup Views
extension LoginViewController {
    func setupViews() {
        // view
        view.backgroundColor = Settings.loginViewBackgroundColor
        
        //subviews
        setupLoginViewContainerConstraints()
        setupRegisterButtonConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupFieldSeparatorConstraints()
        
    }
    
    func setupLoginViewContainerConstraints() {
        view.addSubview(loginViewContainer)
        loginViewContainer.translatesAutoresizingMaskIntoConstraints = false
        loginViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginViewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginViewContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupRegisterButtonConstraints() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: loginViewContainer.bottomAnchor, constant: 12).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        registerButton.heightAnchor.constraint(equalTo: loginViewContainer.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupNameTextFieldConstraints() {
        loginViewContainer.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: loginViewContainer.topAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: loginViewContainer.leadingAnchor, constant: 12).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: loginViewContainer.trailingAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func setupEmailTextFieldConstraints() {
        loginViewContainer.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginViewContainer.leadingAnchor, constant: 12).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: loginViewContainer.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        loginViewContainer.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: loginViewContainer.leadingAnchor, constant: 12).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: loginViewContainer.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func setupFieldSeparatorConstraints() {
        // NameEmailTextField Separator
        loginViewContainer.addSubview(nameEmailSeparatorView)
        nameEmailSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        nameEmailSeparatorView.leadingAnchor.constraint(equalTo: loginViewContainer.leadingAnchor).isActive = true
        nameEmailSeparatorView.trailingAnchor.constraint(equalTo: loginViewContainer.trailingAnchor).isActive = true
        nameEmailSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameEmailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // EmailPasswordTextField Separator
        loginViewContainer.addSubview(emailPasswordSeparatorView)
        emailPasswordSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordSeparatorView.leadingAnchor.constraint(equalTo: loginViewContainer.leadingAnchor).isActive = true
        emailPasswordSeparatorView.trailingAnchor.constraint(equalTo: loginViewContainer.trailingAnchor).isActive = true
        emailPasswordSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}
