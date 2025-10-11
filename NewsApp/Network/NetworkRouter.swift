//
//  NetworkRouter.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol NetworkRouterProtocol {
    func fetchTopHeadlines(category: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
    func fetchGeneralHeadlines(completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
    func searchNews(query: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
}

final class NetworkRouter: NetworkRouterProtocol {
  
    private let service: NetworkManagerProtocol
    
    init(service: NetworkManagerProtocol = NetworkManager()) {
        self.service = service
    }
    
    func fetchTopHeadlines(category: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        let endpoint = NewsEndpoint.topHeadlines(category: category)
        
        service.request(
            path: endpoint.path,
            responseType: NewsResponse.self,
            baseURL: endpoint.baseURL,
            method: HTTPMethod.get,
            parameters: endpoint.parameters,
            completion: completion
        )
    }

    func fetchGeneralHeadlines(completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        let endpoint = NewsEndpoint.topHeadlines(category: "general")
        
        service.request(
            path: endpoint.path,
            responseType: NewsResponse.self,
            baseURL: endpoint.baseURL,
            method: HTTPMethod.get,
            parameters: endpoint.parameters,
            completion: completion
        )
    }

    func searchNews(query: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        let endpoint = NewsEndpoint.everything(query: query)
        
        service.request(
            path: endpoint.path,
            responseType: NewsResponse.self,
            baseURL: endpoint.baseURL,
            method: HTTPMethod.get,
            parameters: endpoint.parameters,
            completion: completion
        )
    }
    
}
