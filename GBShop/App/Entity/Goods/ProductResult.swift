//
//  ProductResult.swift
//  GBShop
//
//  Created by therealniks on 12.08.2021.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
