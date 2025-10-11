//
//  SelectedDiscoverViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import UIKit
import SafariServices

final class SelectedDiscoverViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var viewModel: SelectedDiscoverViewModelProtocol!
    var coordinator: CoordinatorProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupCollectionView()
        fetchArticles()
    }
    
    // MARK: - Setup
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "NewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewCollectionViewCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
    }

    // MARK: - Data
    private func fetchArticles() {
        viewModel.fetchTopHeadlines()
    }

}

// MARK: - UICollectionViewDataSource
extension SelectedDiscoverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as? NewCollectionViewCell else {
            return UICollectionViewCell()
        }
        let article = viewModel.articles[indexPath.item]
        cell.configure(with: article)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SelectedDiscoverViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.item]
        guard let urlString = article.url, let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        navigate(to: safariVC, coordinator: coordinator)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SelectedDiscoverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 3
        
        let width = (collectionView.bounds.width - totalSpacing) / 2
        let height: CGFloat = 320
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - SelectedDiscoverViewModelOutput
extension SelectedDiscoverViewController: SelectedDiscoverViewModelOutput {
    func didUpdateArticles() {
        DispatchQueue.main.async() {
            self.collectionView.reloadData()
        }
    }
    
    func showError(message: String) {
        print("error: \(message)")
    }
}
