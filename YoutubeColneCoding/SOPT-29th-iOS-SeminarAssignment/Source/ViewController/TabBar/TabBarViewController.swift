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
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        shortsVC.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
        plusVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon"), selectedImage: UIImage(named: "plueCircleIcon"))
        subscriptionVC.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        libraryVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        
        tabBar.tintColor = .black
        
        setViewControllers([homeVC, shortsVC, plusVC, subscriptionVC, libraryVC], animated: true)
    }
}
