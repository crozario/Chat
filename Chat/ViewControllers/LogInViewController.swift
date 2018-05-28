//
//  LoginViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//
import UIKit
import Firebase

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    
        setupViews()
        emailTextField.becomeFirstResponder()
        
    }
    
    // MARK: Views
    
    let logInViewContainer: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 5
        loginView.layer.masksToBounds = true
        return loginView
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Constants.Colors.logInButtonBackgroundColor
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()

    let emailPasswordSeparatorView: UIView = {
        let separaterView = UIView()
        separaterView.backgroundColor = Constants.Colors.logInSeparatorViewColor
        return separaterView
    }()
    
    
    // MARK: Actions
    
    @objc func logInButtonPressed() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Invalid Form Failed")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) {
            (authResult, error) in

            if error != nil {
                print(error!)
                return
            }
            print("Log In Success")

            self.dismiss(animated: true, completion: nil)


        }
    }
    
}


// MARK: View Constraints
extension LogInViewController {
    func setupViews() {
        // View
        view.backgroundColor = Constants.Colors.logInViewBackgroundColor
        
        // Subviews
        setupLoginSignUpViewContainerConstraints()
        setupSignUpButtonConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupFieldSeparatorConstraints()
        
        setupTextFieldReturnType()
        
    }
    
    func setupLoginSignUpViewContainerConstraints() {
        view.addSubview(logInViewContainer)
        logInViewContainer.translatesAutoresizingMaskIntoConstraints = false
        logInViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInViewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 80) .isActive = true
        logInViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        logInViewContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setupSignUpButtonConstraints() {
        view.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInButton.topAnchor.constraint(equalTo: logInViewContainer.bottomAnchor, constant: 12).isActive = true
        logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        logInButton.heightAnchor.constraint(equalTo: logInViewContainer.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupEmailTextFieldConstraints() {
        logInViewContainer.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: logInViewContainer.topAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: logInViewContainer.leadingAnchor, constant: 12).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: logInViewContainer.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: logInViewContainer.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        logInViewContainer.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: logInViewContainer.leadingAnchor, constant: 12).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: logInViewContainer.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: logInViewContainer.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupFieldSeparatorConstraints() {
        // EmailPasswordTextField Separator
        logInViewContainer.addSubview(emailPasswordSeparatorView)
        emailPasswordSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordSeparatorView.leadingAnchor.constraint(equalTo: logInViewContainer.leadingAnchor).isActive = true
        emailPasswordSeparatorView.trailingAnchor.constraint(equalTo: logInViewContainer.trailingAnchor).isActive = true
        emailPasswordSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK Text Field Actions
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            print("email text field")
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            print("password text field")
            passwordTextField.resignFirstResponder()
            logInButtonPressed()
        default:
            print("default text field clicked")
            textField.resignFirstResponder()
        }
        return false
    }
    
    func setupTextFieldReturnType() {
        emailTextField.returnKeyType = .continue
        passwordTextField.returnKeyType = .go
    }
}
