//
//  HomeViewBuilder.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

struct HomeViewBuilder {
    static func build(coordinator: Coordinator) -> UIViewController {
        let service: NetworkRouterProtocol = NetworkRouter()
        let viewModel = HomeViewModel(service: service)
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return UIViewController() }
        
        homeVC.viewModel = viewModel
        homeVC.coordinator = coordinator
        return homeVC
    }
}
