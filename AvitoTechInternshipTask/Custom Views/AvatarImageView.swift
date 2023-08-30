//
//  AvatarImageView.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 29.08.2023.
//

import UIKit

class AvatarImageView: UIImageView {

    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.avatarPlaceholder
    
    init(frame: CGRect, cornerRadius: CGFloat) {
        super.init(frame: frame)
        self.layer.cornerRadius = cornerRadius
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        clipsToBounds = true
        image = placeholderImage
        tintColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}
