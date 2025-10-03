//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit
import SafariServices

final class SearchViewController: BaseViewController {

    var coordinator: Coordinator!
    var viewModel: SearchViewModelProtocol!
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle = "Search"
        viewModel.delegate = self
        setupEmptyState()
        setupSearchBar()
        setupCollectionView()
    }
    
    private func setupEmptyState() {
        imageView.tintColor = .label
        emptyStateLabel.text = "Search Something"
        emptyStateLabel.textColor = .label
        emptyStateView.layer.cornerRadius = 8
        emptyStateView.isHidden = false
        collectionView.isHidden = true
    }
        
    private func updateEmptyState() {
        let isEmpty = viewModel.searchResults.isEmpty
        emptyStateView.isHidden = !isEmpty
        collectionView.isHidden = isEmpty
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search for news..."
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "NewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewCollectionViewCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as? NewCollectionViewCell else {
            return UICollectionViewCell()
        }
        let article = viewModel.searchResults[indexPath.item]
        cell.configure(with: article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.searchResults[indexPath.item]
        guard let urlString = article.url, let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        navigate(to: safariVC, coordinator: coordinator)
    }
    
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        viewModel.searchNews(query: query)
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: SearchViewModelOutput {
    func didUpdateSearchResults() {
        self.collectionView.reloadData()
        updateEmptyState()
    }
    
    func showError(message: String) {
        print("error: \(message)")
    }
}
