//
//  DiscoverViewController.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 1.10.2025.
//

import UIKit

final class DiscoverViewController: BaseViewController {
    
    var coordinator: Coordinator!
    var viewModel: DiscoverViewModelProtocol!
    private let categories = NewsCategory.allCases
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        pageTitle = "Discover"
        super.viewDidLoad()
        viewModel.delegate = self
        setupCollectionView()
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            let firstItemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(180)
            )
            let firstItem = NSCollectionLayoutItem(layoutSize: firstItemSize)
            firstItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
            
            let smallItemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(140)
            )
            let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
            smallItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8)
            
            let smallGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(140)
                ),
                subitems: [smallItem, smallItem]
            )
            
            var groupItems: [NSCollectionLayoutItem] = []
            if self.categories.count > 0 {
                groupItems.append(firstItem)
            }
            
            let remainingCount = self.categories.count - 1
            let pairCount = remainingCount / 2
            for _ in 0..<pairCount {
                groupItems.append(smallGroup)
            }
            if remainingCount % 2 != 0 {
                let lastSingle = NSCollectionLayoutItem(layoutSize: smallItemSize)
                lastSingle.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
                groupItems.append(lastSingle)
            }
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(1000)
                ),
                subitems: groupItems
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            
            return section
        }
    }
        
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let category = categories[indexPath.item]
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        let vc = SelectedDiscoverViewBuilder.build(coordinator: self.coordinator, category: category.rawValue)
        vc.title = category.rawValue
        navigate(to: vc, coordinator: coordinator)
    }
}

extension DiscoverViewController: DiscoverViewModelOutput {
    func showError(message: String) {
        print("error: \(message)")
    }
}
