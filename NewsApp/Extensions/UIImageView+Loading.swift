//
//  UIImageView+Loading.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 4.10.2025.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWithLoading(from urlString: String?, placeholder: UIImage? = nil, placeholderTintColor: UIColor? = nil) {
        removeLoadingIndicator()
        
        self.image = nil
        
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            
            if let placeholder = placeholder {
                self.image = placeholder.withTintColor(placeholderTintColor ?? .systemGray5, renderingMode: .alwaysOriginal)
            } else {
                self.image = nil
            }
            return
        }
        
        addLoadingIndicator()
        
        self.kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ]
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.removeLoadingIndicator()
                
                if case .failure = result, let placeholder = placeholder {
                    self?.image = placeholder.withTintColor(placeholderTintColor ?? .systemGray5, renderingMode: .alwaysOriginal)
                }
            }
        }
    }
        
    private func addLoadingIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.tag = 999
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .systemGray2
        
        let backgroundView = UIView()
        backgroundView.tag = 998
        backgroundView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.7)
        backgroundView.layer.cornerRadius = 8
        backgroundView.clipsToBounds = true
        
        addSubview(backgroundView)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        updateLoadingIndicatorFrame()
    }
    
    private func updateLoadingIndicatorFrame() {
        guard let activityIndicator = viewWithTag(999) as? UIActivityIndicatorView,
              let backgroundView = viewWithTag(998) else { return }
        
        backgroundView.frame = bounds
        activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func removeLoadingIndicator() {
        if let activityIndicator = viewWithTag(999) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
        if let backgroundView = viewWithTag(998) {
            backgroundView.removeFromSuperview()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateLoadingIndicatorFrame()
    }
}
