//
//  DiscoverViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol DiscoverViewModelProtocol {
    var delegate: DiscoverViewModelOutput? { get set }
}

protocol DiscoverViewModelOutput: AnyObject {
    func showError(message: String)
    
}

final class DiscoverViewModel: DiscoverViewModelProtocol {
    
    weak var delegate: DiscoverViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }
}
