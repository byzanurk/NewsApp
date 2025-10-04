//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import UIKit

class BaseViewController: UIViewController {

    var pageTitle: String = "" {
        didSet {
            self.navigationItem.title = pageTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        tabBarItem.title = nil
    }
}
