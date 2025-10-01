//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import Foundation

// MARK: NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func request<T: Decodable>(
        path: String,
        responseType: T.Type,
        baseURL: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

// MARK: NetworkManager
final class NetworkManager: NetworkManagerProtocol {
    
    func request<T: Decodable>(
        path: String,
        responseType: T.Type,
        baseURL: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: path, relativeTo: URL(string: baseURL)) else {
            DispatchQueue.main.async { completion(.failure(.invalidURL)) }
            return
        }
        var urlString = url.absoluteString
        
        if method == .get, let parameters = parameters {
            var components = URLComponents(string: urlString)
            components?.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            if let urlWithQuery = components?.url {
                urlString = urlWithQuery.absoluteString
            }
        }
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async { completion(.failure(.invalidURL)) }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method != .get, let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                DispatchQueue.main.async { completion(.failure(.unknown(error))) }
                return
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(.unknown(error))) }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async { completion(.failure(.noData)) }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async { completion(.failure(.serverError(statusCode: httpResponse.statusCode))) }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(.noData)) }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(responseType, from: data)
                DispatchQueue.main.async { completion(.success(decoded)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(.decodingError(error))) }
            }
        }.resume()
    }
}
