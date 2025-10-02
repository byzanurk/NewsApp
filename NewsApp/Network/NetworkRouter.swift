//
//  NetworkRouter.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

protocol NetworkRouterProtocol {
    // alll fetch func
}

final class NetworkRouter: NetworkRouterProtocol {
    
    let service: NetworkManagerProtocol
    
    init(service: NetworkManagerProtocol = NetworkManager()) {
        self.service = service
    }
    
    // all fetch funcs
    
    
}
