//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol SearchViewModelProtocol {
    var delegate: SearchViewModelOutput? { get set }
}

protocol SearchViewModelOutput: AnyObject {
    func showError(message: String)
}



final class SearchViewModel: SearchViewModelProtocol {
    
    weak var delegate: SearchViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }

    
}
