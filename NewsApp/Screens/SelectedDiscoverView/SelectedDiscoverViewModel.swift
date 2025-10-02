//
//  SelectedDiscoverViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import Foundation

protocol SelectedDiscoverViewModelProtocol {
    var articles: [Article] { get set }
    var delegate: SelectedDiscoverViewModelOutput? { get set }
}

protocol SelectedDiscoverViewModelOutput: AnyObject {
    func showError(message: String)
}

final class SelectedDiscoverViewModel: SelectedDiscoverViewModelProtocol {
    
    var articles: [Article] = []
    weak var delegate: SelectedDiscoverViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }
    
}
