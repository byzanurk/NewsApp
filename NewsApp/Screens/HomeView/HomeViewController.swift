//
//  ViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var coordinator: Coordinator!
    var viewModel: HomeViewModelProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }


}

extension HomeViewController: HomeViewModelOutput {
    func showError(message: String) {
        print("error: \(message)")
    }
}
