//
//  Endpoint.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 3.10.2025.
//

import Foundation

enum NewsEndpoint {
    case topHeadlines (category: String, country: String = "us")
    case everything (query: String)
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "/v2/top-headlines"
        case .everything:
            return "/v2/everything"
        }
    }
    
    var baseURL: String {
        return "https://newsapi.org"
    }
    
    var parameters: [String: Any] {
        switch self {
        case let .topHeadlines(category, country):
            return [
                "country" : country,
                "category" : category,
                "apiKey" : "d0c5a805f78549f293ff8b2aa970139a"
            ]
        case .everything(let query):
            return [
                "apiKey": "d0c5a805f78549f293ff8b2aa970139a",
                "q": query,
                "sortBy": "publishedAt",
                "language": "en"
            ]
        }
    }
    
    
}
