//
//  TabBarViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/19.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTabBar()
    }

}

// MARK: - Extensions

extension TabBarViewController {
    private func initTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.home),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.shotrs),
              let plusVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.plus),
              let subscriptionVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.subscription),
              let libraryVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.library) else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        plusVC.tabBarItem.title = "추가"
        plusVC.tabBarItem.image = UIImage(named: "plueCircleIcon")
        plusVC.tabBarItem.selectedImage = UIImage(named: "plueCircleIcon")
        
        subscriptionVC.tabBarItem.title = "구독"
        subscriptionVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscriptionVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        libraryVC.tabBarItem.title = "보관함"
        libraryVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        tabBar.tintColor = .black
        
        setViewControllers([homeVC, shortsVC, plusVC, subscriptionVC, libraryVC], animated: true)
    }
}
