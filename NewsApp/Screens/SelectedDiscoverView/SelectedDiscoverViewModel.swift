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
    func fetchTopHeadlines()
}

protocol SelectedDiscoverViewModelOutput: AnyObject {
    func didUpdateArticles()
    func showError(message: String)
}

final class SelectedDiscoverViewModel: SelectedDiscoverViewModelProtocol {
    
    var articles: [Article] = []
    weak var delegate: SelectedDiscoverViewModelOutput?
    private let service: NetworkRouterProtocol
    private let category: String
    
    init(service: NetworkRouterProtocol, category: String) {
        self.service = service
        self.category = category
    }
    
    func fetchTopHeadlines() {
        service.fetchTopHeadlines(category: category) { [weak self] result in
            
            switch result {
            case .success(let success):
                self?.articles = success.articles
                self?.delegate?.didUpdateArticles()
            case .failure(let error):
                self?.delegate?.showError(message: error.localizedDescription)
                print("error fetching top headlines articles:", error)
            }
        }
    }
    
    
    
}
