//
//  DetailInfoViewController.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 30.08.2023.
//

import UIKit


class DetailInfoViewController: UIViewController {
    
    let avatarImageView = AvatarImageView(frame: .zero, cornerRadius: 0)
    let detailTitleLabel = TitleLabel(textAlignment: .left, fontSize: 24, weight: .regular, color: .label)
    let priceLabel = TitleLabel(textAlignment: .left, fontSize: 30, weight: .bold, color: .label)
    let locationLabel = TitleLabel(textAlignment: .left, fontSize: 18, weight: .regular, color: .label)
    let characteristicsLabel = TitleLabel(textAlignment: .left, fontSize: 22, weight: .semibold, color: .label)
    let createdDateLabel = TitleLabel(textAlignment: .left, fontSize: 18, weight: .regular, color: .label)
    let emailLabel = TitleLabel(textAlignment: .left, fontSize: 18, weight: .regular, color: .label)
    let phoneNumberLabel = TitleLabel(textAlignment: .left, fontSize: 18, weight: .regular, color: .label)
    let descriptionTitleLabel = TitleLabel(textAlignment: .left, fontSize: 22, weight: .semibold, color: .label)
    let descriptionLabel = TitleLabel(textAlignment: .left, fontSize: 18, weight: .regular, color: .label)
    
    var detail: Detail!
    
    
    init(detail: Detail) {
        super.init(nibName: nil, bundle: nil)
        self.detail = detail
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(avatarImageView, detailTitleLabel, priceLabel, locationLabel, characteristicsLabel, createdDateLabel, emailLabel, phoneNumberLabel, descriptionTitleLabel, descriptionLabel)
        layoutUI()
        configureUIElements()
    }
    
    
    func configureUIElements() {
        avatarImageView.downloadImage(fromURL: detail.imageURL)
        detailTitleLabel.text = detail.title
        detailTitleLabel.numberOfLines = 2
        priceLabel.text = detail.price
        locationLabel.text = detail.location + " " + (detail.address ?? "")
        locationLabel.numberOfLines = 2
        characteristicsLabel.text = Labels.characteristics
        createdDateLabel.text = detail.createdDate
        emailLabel.text = detail.email ?? Labels.noEmail
        phoneNumberLabel.text = detail.phoneNumber ?? Labels.noPhoneNumber
        descriptionTitleLabel.text = Labels.description
        descriptionLabel.text  = detail.description ?? Labels.noDescription
        descriptionLabel.numberOfLines = 3
    }
    
    
    func layoutUI() {
        let textImagePadding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 300),
            
            priceLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            detailTitleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            detailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            detailTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            locationLabel.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: textImagePadding),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            characteristicsLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: textImagePadding),
            characteristicsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            characteristicsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characteristicsLabel.heightAnchor.constraint(equalToConstant: 25),
            
            createdDateLabel.topAnchor.constraint(equalTo: characteristicsLabel.bottomAnchor, constant: textImagePadding),
            createdDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            createdDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createdDateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: createdDateLabel.bottomAnchor, constant: textImagePadding),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: textImagePadding),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: textImagePadding),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: textImagePadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -textImagePadding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
