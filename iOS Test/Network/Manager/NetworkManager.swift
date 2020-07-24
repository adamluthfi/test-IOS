//
//  NetworkManager.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import Moya

class NetworkManager<T: BaseApi> {
    
    func api() -> MoyaProvider<T> {
        let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        return provider
    }
    
}
