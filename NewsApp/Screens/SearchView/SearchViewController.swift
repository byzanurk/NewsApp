//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

final class SearchViewController: UIViewController {

    var coordinator: Coordinator!
    var viewModel: SearchViewModelProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
}

extension SearchViewController: SearchViewModelOutput {
    func showError(message: String) {
        print("error: \(message)")
    }
}
