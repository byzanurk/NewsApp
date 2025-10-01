//
//  CoordinatorProtocol.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

// MARK: CoordinatorProtocol
protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get set }
    var parentCoordinator: CoordinatorProtocol? { get set }
    func eventOccurred(with viewController: UIViewController)
    func start()
}
