//
//  Results.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 19/11/21.
//

import Foundation

struct Results: Codable {
    
    let productCount : Int?
    let products : [Product]?
    let title : String?
    enum CodingKeys: String, CodingKey {
        case productCount = "product_count"
        case products = "products"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productCount = try values.decodeIfPresent(Int.self, forKey: .productCount)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}



