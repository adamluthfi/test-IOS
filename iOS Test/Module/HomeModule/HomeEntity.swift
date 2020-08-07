//
//  HomeEntity.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

struct HomeEntity: Codable {
    var data: HomeEntityModel?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(HomeEntityModel.self, forKey: .data)
    }
}

struct HomeEntityModel: Codable {
    let category: [Category]?
    let productPromo: [ProductPromo]?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case productPromo = "productPromo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decodeIfPresent([Category].self, forKey: .category)
        productPromo = try container.decodeIfPresent([ProductPromo].self, forKey: .productPromo)
    }
    
}

// MARK: - Category
struct Category: Codable {
    let imageURL: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case id, name
    }
}

// MARK: - ProductPromo
struct ProductPromo: Codable {
    let id: String
    let imageURL: String
    let title, productPromoDescription, price: String
    let loved: Int

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case title
        case productPromoDescription = "description"
        case price, loved
    }
}

typealias HomeData = [HomeEntity]
