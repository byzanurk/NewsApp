//
//  TabBarController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

// MARK: TabBarController
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: DiscoverViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "safari")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }

    
}
