//
//  AdvertisementCell.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 29.08.2023.
//

import UIKit

class AdvertisementCell: UICollectionViewCell {
    
    static let reuseID = "AdvertisementCell"
    let avatarImageView = AvatarImageView(frame: .zero, cornerRadius: 7)
    let titleLabel = TitleLabel(textAlignment: .left, fontSize: 16, weight: .regular, color: .label)
    let priceLabel = TitleLabel(textAlignment: .left, fontSize: 16, weight: .bold, color: .label)
    let locationLabel = TitleLabel(textAlignment: .left, fontSize: 14, weight: .regular, color: .systemGray)
    let dateLabel = TitleLabel(textAlignment: .left, fontSize: 14, weight: .regular, color: .systemGray)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(ad: Advertisement) {
        avatarImageView.downloadImage(fromURL: ad.imageURL)
        titleLabel.text = ad.title
        titleLabel.numberOfLines = 2
        priceLabel.text = ad.price
        locationLabel.text = ad.location
        dateLabel.text = ad.createdDate
    }
    
    
    private func configure() {
        addSubviews(avatarImageView, titleLabel, priceLabel, locationLabel, dateLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 14),
            
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 14),
            
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 14),
        ])
    }
}
