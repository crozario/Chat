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
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
        
    }
    
    @objc func handleLogout() {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
        
    }
}
