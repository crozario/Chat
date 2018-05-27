//
//  HomeViewController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
//        if Auth.auth().currentUser?.uid == nil {
//            handleLogout()
//        }
        handleLogout()
    }
    
    @objc func handleLogout() {
//        do {
//            try Auth.auth().signOut()
//        } catch let logoutError {
//            print(logoutError)
//        }
        let authenticationViewController = AuthenticationViewController()
        present(authenticationViewController, animated: true, completion: nil)
        
    }
}
