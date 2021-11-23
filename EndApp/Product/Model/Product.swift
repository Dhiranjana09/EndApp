//
//  Products.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 19/11/21.
//

import Foundation

struct Product: Codable {
    
    let id : String?
    let image : String?
    let name : String?
    let price : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
        case name = "name"
        case price = "price"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
    }
}


