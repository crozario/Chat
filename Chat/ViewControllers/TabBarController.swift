//
//  TabBarController.swift
//  Chat
//
//  Created by Crossley Rozario on 5/27/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.tabBarItem.title = "Home"
        
        let searchViewController = SearchViewController()
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Search"
        
        viewControllers = [homeViewController, searchViewController]
    }

}


extension TabBarController: UITabBarControllerDelegate {
    
}
