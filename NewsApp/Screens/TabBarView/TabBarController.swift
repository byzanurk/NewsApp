//
//  TabBarController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

// MARK: TabBarController
final class TabBarController: UITabBarController {

    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        
        let vc1 = HomeViewBuilder.build(coordinator: coordinator)
        let vc2 = DiscoverViewBuilder.build(coordinator: coordinator)
        let vc3 = SearchViewBuilder.build(coordinator: coordinator)
                
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav1.tabBarItem.image = UIImage(systemName: "house")
        nav2.tabBarItem.image = UIImage(systemName: "safari")
        nav3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        tabBar.tintColor = .brown
        
        setViewControllers([nav1, nav2, nav3], animated: true)
        
        selectedIndex = 1
    }

    
}
