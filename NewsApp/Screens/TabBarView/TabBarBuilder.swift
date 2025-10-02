//
//  TabBarBuilder.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

final class TabBarBuilder {
    static func build(coordinator: Coordinator) -> UITabBarController {
        let tabBar = TabBarController(coordinator: coordinator)
        tabBar.coordinator = coordinator
        return tabBar
    }
}

