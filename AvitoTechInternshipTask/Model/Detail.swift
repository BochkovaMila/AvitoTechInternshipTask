//
//  Detail.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 28.08.2023.
//

import Foundation

struct Detail: Codable {
    
    let id, title, price, location: String
    let imageURL: String
    let createdDate: String
    let address, description, email, phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
        case description, email
        case phoneNumber = "phone_number"
        case address
    }
}
