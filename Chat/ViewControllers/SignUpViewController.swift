//
//  SignUpViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/27/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupViews()
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: Views
    
    let signUpViewContainer: UIView = {
        let signUpView = UIView()
        signUpView.backgroundColor = UIColor.white
        signUpView.layer.cornerRadius = 5
        signUpView.layer.masksToBounds = true
        return signUpView
    }()
    
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let nameEmailSeparatorView: UIView = {
        let separaterView = UIView()
        separaterView.backgroundColor = Constants.Colors.signUpSeparatorViewColor
        return separaterView
    }()
    
    let emailPasswordSeparatorView: UIView = {
        let separaterView = UIView()
        separaterView.backgroundColor = Constants.Colors.signUpSeparatorViewColor
        return separaterView
    }()
    
    // MARK: Actions
    
    @objc func signUpButtonPressed() {
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            print("Sign Up Failed")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {
            (authResult, error) in

            if error != nil {
                print(error!)
                return
            }

            guard let userId = Auth.auth().currentUser?.uid  else {
                return
            }

            var ref: DatabaseReference!
            ref = Database.database().reference()

            let usersReference = ref.child("users").child(userId)

            let values = ["name" : name, "email" : email]
            usersReference.updateChildValues(values, withCompletionBlock: {
                (error, ref) in

                if error != nil {
                    print(error!)
                    return
                }
                print("Saved User to Firebase")
                self.dismiss(animated: true, completion: nil)
            })
        }

    }
}


// MARK: View Constraints
extension SignUpViewController {
    func setupViews() {
        // View
        view.backgroundColor = Constants.Colors.signUpViewBackgroundColor
        
        // Subviews
        setupSignUpViewContainerConstraints()
        setupSignUpButtonConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupFieldSeparatorConstraints()
        
        setupTextFieldReturnType()
    }
    
    func setupSignUpViewContainerConstraints() {
        view.addSubview(signUpViewContainer)
        signUpViewContainer.translatesAutoresizingMaskIntoConstraints = false
        signUpViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpViewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 80) .isActive = true
        signUpViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        signUpViewContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    func setupSignUpButtonConstraints() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signUpViewContainer.bottomAnchor, constant: 12).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: signUpViewContainer.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupNameTextFieldConstraints() {
        signUpViewContainer.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: signUpViewContainer.topAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: signUpViewContainer.leadingAnchor, constant: 12).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: signUpViewContainer.trailingAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: signUpViewContainer.heightAnchor, multiplier: 1/3).isActive = true
        
    }
    func setupEmailTextFieldConstraints() {
        signUpViewContainer.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: signUpViewContainer.leadingAnchor, constant: 12).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: signUpViewContainer.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: signUpViewContainer.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        signUpViewContainer.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: signUpViewContainer.leadingAnchor, constant: 12).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: signUpViewContainer.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: signUpViewContainer.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupFieldSeparatorConstraints() {
        // NameEmailTextField Separator
        signUpViewContainer.addSubview(nameEmailSeparatorView)
        nameEmailSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        nameEmailSeparatorView.leadingAnchor.constraint(equalTo: signUpViewContainer.leadingAnchor).isActive = true
        nameEmailSeparatorView.trailingAnchor.constraint(equalTo: signUpViewContainer.trailingAnchor).isActive = true
        nameEmailSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameEmailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // EmailPasswordTextField Separator
        signUpViewContainer.addSubview(emailPasswordSeparatorView)
        emailPasswordSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordSeparatorView.leadingAnchor.constraint(equalTo: signUpViewContainer.leadingAnchor).isActive = true
        emailPasswordSeparatorView.trailingAnchor.constraint(equalTo: signUpViewContainer.trailingAnchor).isActive = true
        emailPasswordSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

// MARK: Text Field Actions
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            print("name text field")
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        case emailTextField:
            print("email text field")
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            print("password text field")
            passwordTextField.resignFirstResponder()
            signUpButtonPressed()
        default:
            print("default text field clicked")
            textField.resignFirstResponder()
        }
        return false
    }
    
    func setupTextFieldReturnType() {
        nameTextField.returnKeyType = .continue
        emailTextField.returnKeyType = .continue
        passwordTextField.returnKeyType = .join
    }
}
