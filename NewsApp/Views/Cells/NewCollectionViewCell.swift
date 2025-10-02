//
//  NewCollectionViewCell.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 2.10.2025.
//

import UIKit
import Kingfisher

class NewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.masksToBounds = false
    }

    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? article.source?.name
        dateLabel.text = article.publishedAt
        
        if let urlString = article.urlToImage, let url = URL(string: urlString) {
            imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        } else {
            imageView.image = UIImage(systemName: "photo")
        }
        
    }
}
