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
    case heroStats
}

extension ApiConstant: BaseApi {
    var baseURL: URL {
        switch self {
        case .heroStats:
            guard let url = URL(string: ApiConfig.BASE_URL) else { fatalError("server in problem") }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .heroStats:
            return "/herostats"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .heroStats:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .heroStats:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .heroStats:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .heroStats:
            return [:]
        }
    }
}
