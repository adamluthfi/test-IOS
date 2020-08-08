//
//  HomeEntity.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import RealmSwift

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
class ProductPromo: Object, Codable {
    
    @objc dynamic var id: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var title, productPromoDescription, price: String?
    @objc dynamic var loved: Int = 0

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case title
        case productPromoDescription = "description"
        case price, loved
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    public required convenience init(form decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        title = try container.decode(String.self, forKey: .title)
        productPromoDescription = try container.decode(String.self, forKey: .productPromoDescription)
        price = try container.decode(String.self, forKey: .price)
        loved = try container.decode(Int.self, forKey: .loved)
    }
}

typealias HomeData = [HomeEntity]
