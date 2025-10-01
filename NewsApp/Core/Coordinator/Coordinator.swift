//
//  Coordinator.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

// MARK: Coordinator
final class Coordinator: CoordinatorProtocol {
    
    // MARK: Properties
    var navigationController: UINavigationController?
    var parentCoordinator: CoordinatorProtocol?
    var children: [CoordinatorProtocol] = []
    
    // MARK: Functions
    func eventOccurred(with viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start() {
        // Initial view controller setup
        let tabBar = TabBarBuilder.build()
        navigationController = UINavigationController(rootViewController: tabBar)
    }
    
    
}
