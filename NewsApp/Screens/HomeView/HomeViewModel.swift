//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol HomeViewModelProtocol {
    var articles: [Article] { get set }
    var delegate: HomeViewModelOutput? { get set }
    func fetchGeneralHeadlines()
}

protocol HomeViewModelOutput: AnyObject {
    func didUpdateArticles()
    func showError(message: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var articles: [Article] = []
    weak var delegate: HomeViewModelOutput?
    private let service: NetworkRouterProtocol
    
    init(service: NetworkRouterProtocol) {
        self.service = service
    }

    func fetchGeneralHeadlines() {
        service.fetchGeneralHeadlines { [weak self] result in
            switch result {
            case .success(let success):
                self?.articles = success.articles
                self?.delegate?.didUpdateArticles()
            case .failure(let error):
                self?.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
    
}
