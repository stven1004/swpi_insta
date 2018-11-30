//
//  MainTabBarController.swift
//  instagramFirebase
//
//  Created by Seungjun Lim on 30/11/2018.
//  Copyright © 2018 Seungjun Lim. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        
        let navController = UINavigationController(rootViewController: userProfileController)
        
        navController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        let testViewController = TestViewController()
        
        testViewController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        testViewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        tabBar.tintColor = .black
        
        viewControllers = [navController, testViewController, UIViewController()] //UIViewController()]
    }
}
