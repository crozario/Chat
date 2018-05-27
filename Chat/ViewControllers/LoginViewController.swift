//
//  LoginViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//
import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // Constraint References
    
    var loginSignUpViewContainerHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    // MARK: Actions
    
    @objc func handleSignup() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
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
    
    @objc func handleLoginSignUpChangeControl() {
        let title = loginSignUpSegmentedControl.titleForSegment(at: loginSignUpSegmentedControl.selectedSegmentIndex)
        
        loginSignUpButton.setTitle(title, for: .normal)
        loginSignUpViewContainerHeightAnchor?.constant = loginSignUpSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: loginSignUpSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: loginSignUpSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: loginSignUpSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    
    
    // MARK: Create Views
    let loginSignUpViewContainer: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 5
        loginView.layer.masksToBounds = true
        return loginView
    }()
    
    let loginSignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Settings.loginMainColor
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
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
    
    let loginSignUpSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Sign Up"])
        segmentedControl.tintColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(handleLoginSignUpChangeControl), for: .valueChanged)
        return segmentedControl
    }()
    
}


// MARK: Setup Views
extension LoginViewController {
    func setupViews() {
        // view
        view.backgroundColor = Settings.loginViewBackgroundColor
        
        //subviews
        setupLoginSignUpViewContainerConstraints()
        setupSignUpButtonConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupFieldSeparatorConstraints()
        setupLoginSignUpSegmentedControlConstraints()
        
    }
    
    func setupLoginSignUpViewContainerConstraints() {
        view.addSubview(loginSignUpViewContainer)
        loginSignUpViewContainer.translatesAutoresizingMaskIntoConstraints = false
        loginSignUpViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginSignUpViewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginSignUpViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginSignUpViewContainerHeightAnchor = loginSignUpViewContainer.heightAnchor.constraint(equalToConstant: 150)
        loginSignUpViewContainerHeightAnchor?.isActive = true
        
    }
    
    func setupSignUpButtonConstraints() {
        view.addSubview(loginSignUpButton)
        loginSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        loginSignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginSignUpButton.topAnchor.constraint(equalTo: loginSignUpViewContainer.bottomAnchor, constant: 12).isActive = true
        loginSignUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginSignUpButton.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupNameTextFieldConstraints() {
        loginSignUpViewContainer.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: loginSignUpViewContainer.topAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: loginSignUpViewContainer.leadingAnchor, constant: 12).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: loginSignUpViewContainer.trailingAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
    }
    func setupEmailTextFieldConstraints() {
        loginSignUpViewContainer.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginSignUpViewContainer.leadingAnchor, constant: 12).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: loginSignUpViewContainer.trailingAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        loginSignUpViewContainer.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: loginSignUpViewContainer.leadingAnchor, constant: 12).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: loginSignUpViewContainer.trailingAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: loginSignUpViewContainer.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupFieldSeparatorConstraints() {
        // NameEmailTextField Separator
        loginSignUpViewContainer.addSubview(nameEmailSeparatorView)
        nameEmailSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        nameEmailSeparatorView.leadingAnchor.constraint(equalTo: loginSignUpViewContainer.leadingAnchor).isActive = true
        nameEmailSeparatorView.trailingAnchor.constraint(equalTo: loginSignUpViewContainer.trailingAnchor).isActive = true
        nameEmailSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameEmailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // EmailPasswordTextField Separator
        loginSignUpViewContainer.addSubview(emailPasswordSeparatorView)
        emailPasswordSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordSeparatorView.leadingAnchor.constraint(equalTo: loginSignUpViewContainer.leadingAnchor).isActive = true
        emailPasswordSeparatorView.trailingAnchor.constraint(equalTo: loginSignUpViewContainer.trailingAnchor).isActive = true
        emailPasswordSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupLoginSignUpSegmentedControlConstraints() {
        view.addSubview(loginSignUpSegmentedControl)
        loginSignUpSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        loginSignUpSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginSignUpSegmentedControl.widthAnchor.constraint(equalTo: loginSignUpViewContainer.widthAnchor, multiplier: 0.5).isActive = true
        loginSignUpSegmentedControl.bottomAnchor.constraint(equalTo: loginSignUpViewContainer.topAnchor, constant: -12).isActive = true
        loginSignUpSegmentedControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}
