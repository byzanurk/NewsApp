//
//  Category.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import Foundation

enum NewsCategory: String, CaseIterable {
    case general = "General"
    case business = "Business"
    case entertainment = "Entertainment"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    var apiValue: String {
        return rawValue.lowercased()
    }
    
    var imageName: String {
        switch self {
        case .general: return "general"
        case .business: return "business"
        case .entertainment: return "entertainment"
        case .health: return "health"
        case .science: return "science"
        case .sports: return "sports"
        case .technology: return "technology"
        }
    }
    
}
