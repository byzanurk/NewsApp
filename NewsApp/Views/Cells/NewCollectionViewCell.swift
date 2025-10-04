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
        setupCell()
    }
    
    private func setupCell() {
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.systemGray6.cgColor
        contentView.backgroundColor = .systemBackground
        updateBorderColor()
        
        authorLabel.numberOfLines = 0
        authorLabel.lineBreakMode = .byTruncatingTail
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.masksToBounds = false
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.updateBorderColor()
        }
    }

    private func updateBorderColor() {
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
    }

    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? article.source?.name
        dateLabel.text = article.publishedAt
        
        
        imageView.setImageWithLoading(
            from: article.urlToImage,
            placeholder: UIImage(systemName: "newspaper")
        )
        
    }
}
