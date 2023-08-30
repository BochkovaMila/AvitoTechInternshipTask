//
//  MainPage.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 28.08.2023.
//

import Foundation

struct Ads: Codable {
    let advertisements: [Advertisement]
}


struct Advertisement: Codable, Hashable {
    let id, title, price, location: String
    let imageURL: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
}
