//
//  TabBarController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

// MARK: TabBarController
final class TabBarController: UITabBarController {

    private let coordinator: CoordinatorProtocol

    init(coordinator: CoordinatorProtocol) {
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

        let homeVC = HomeViewBuilder.build(coordinator: coordinator)
        let discoverVC = DiscoverViewBuilder.build(coordinator: coordinator)
        let searchVC = SearchViewBuilder.build(coordinator: coordinator)

        let homeNav = UINavigationController(rootViewController: homeVC)
        let discoverNav = UINavigationController(rootViewController: discoverVC)
        let searchNav = UINavigationController(rootViewController: searchVC)

        homeNav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        discoverNav.tabBarItem = UITabBarItem(
            title: "Discover",
            image: UIImage(systemName: "safari"),
            selectedImage: UIImage(systemName: "safari.fill")
        )
        searchNav.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )

        [homeNav, discoverNav, searchNav].forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }

        tabBar.tintColor = .systemGreen

        setViewControllers([homeNav, discoverNav, searchNav], animated: false)

        selectedIndex = 0
    }
}

