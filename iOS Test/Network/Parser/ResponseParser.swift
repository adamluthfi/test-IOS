//
//  ResponseParser.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import Moya

class ResponseParser {
    static let shared = ResponseParser()
    
    let decoder = JSONDecoder()
    
    func parse<ResponseType: Codable>(to: ResponseType.Type, from response: Moya.Response) -> ResponseType? {
        do {
            let response = try decoder.decode(ResponseType.self, from: response.data)
            return response
        } catch(let error) {
            print(error)
            return nil
        }
    }
}
