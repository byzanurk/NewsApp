//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol SearchViewModelProtocol {
    var searchResults: [Article] { get set }
    var delegate: SearchViewModelOutput? { get set }
    func searchNews(query: String)
}

protocol SearchViewModelOutput: AnyObject {
    func didUpdateSearchResults()
    func showError(message: String)
}

final class SearchViewModel: SearchViewModelProtocol {
    
    var searchResults: [Article] = []
    weak var delegate: SearchViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }

    func searchNews(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            delegate?.didUpdateSearchResults()
            return
        }
        
        service.searchNews(query: query) { [weak self] result in
            switch result {
            case .success(let success):
                self?.searchResults = success.articles
                self?.delegate?.didUpdateSearchResults()
            case .failure(let error):
                self?.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
    
}
