//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelOutput? { get set }
}

protocol HomeViewModelOutput: AnyObject {
    func showError(message: Error)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    weak var delegate: HomeViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }

    
}
