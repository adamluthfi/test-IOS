//
//  ApiConstant.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import Moya

enum ApiConstant {
    case product
}

extension ApiConstant: BaseApi {
    var baseURL: URL {
        switch self {
        case .product:
            guard let url = URL(string: ApiConfig.BASE_URL) else { fatalError("server in problem") }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .product:
            return "/home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .product:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .product:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .product:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .product:
            return [:]
        }
    }
}
