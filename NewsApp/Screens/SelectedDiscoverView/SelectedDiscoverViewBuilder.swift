//
//  SelectedDiscoverViewBuilder.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import Foundation
import UIKit

struct SelectedDiscoverViewBuilder {
    static func build(coordinator: Coordinator, category: String) -> UIViewController {
        let service: NetworkRouterProtocol = NetworkRouter()
        let viewModel = SelectedDiscoverViewModel(service: service, category: category)
        let storyboard = UIStoryboard(name: "SelectedDiscoverViewController", bundle: nil)
        guard let discoverVC = storyboard.instantiateViewController(withIdentifier: "SelectedDiscoverViewController") as? SelectedDiscoverViewController else { return UIViewController()}
        
        discoverVC.viewModel = viewModel
        discoverVC.coordinator = coordinator
        discoverVC.title = category
        
        return discoverVC
    }
}
