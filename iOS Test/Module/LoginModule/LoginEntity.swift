//
//  LoginEntity.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

struct LoginEntity: Codable {
    var data: [LoginEntityModel]?
}

struct LoginEntityModel: Codable {
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}
