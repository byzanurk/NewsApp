//
//  SearchViewBuilder.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation
import UIKit

struct SearchViewBuilder {
    static func build(coordinator: CoordinatorProtocol) -> UIViewController {
        let service: NetworkRouterProtocol = NetworkRouter()
        let viewModel = SearchViewModel(service: service)
        let storyboard = UIStoryboard(name: "SearchViewController", bundle: nil)
        guard let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return UIViewController() }
        
        searchVC.viewModel = viewModel
        searchVC.coordinator = coordinator
        return searchVC
    }
}

