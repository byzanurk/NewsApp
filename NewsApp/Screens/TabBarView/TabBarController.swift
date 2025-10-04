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

        vc1.title = nil
        vc2.title = nil
        vc3.title = nil
        
        nav1.title = nil
        nav2.title = nil
        nav3.title = nil

        nav1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        nav2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "safari"), selectedImage: UIImage(systemName: "safari.fill"))
        nav3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        nav1.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        nav2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        nav3.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        tabBar.tintColor = .systemGreen
        
        setViewControllers([nav1, nav2, nav3], animated: true)
        
        selectedIndex = 1
    }

    
}
