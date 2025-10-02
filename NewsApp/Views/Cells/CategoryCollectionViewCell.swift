//
//  CategoryCollectionViewCell.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
        
    func configure(with category: NewsCategory) {
        imageView.image = UIImage(named: category.imageName)
        titleLabel.text = category.rawValue
    }
}
