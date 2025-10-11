//
//  DiscoverViewBuilder.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

struct DiscoverViewBuilder {
    static func build(coordinator: CoordinatorProtocol) -> UIViewController {
        let service: NetworkRouterProtocol = NetworkRouter()
        let viewModel = DiscoverViewModel(service: service)
        let storyboard = UIStoryboard(name: "DiscoverViewController", bundle: nil)
        guard let discoverVC = storyboard.instantiateViewController(withIdentifier: "DiscoverViewController") as? DiscoverViewController else { return UIViewController() }
        
        discoverVC.viewModel = viewModel
        discoverVC.coordinator = coordinator
        return discoverVC
    }
}

