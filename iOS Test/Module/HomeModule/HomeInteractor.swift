//
//  HomeInteractor.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var output: HomeInteractorOutputProtocol?
    let provider = NetworkManager<ApiConstant>()
    
    func fetchData() {
        provider.api().request(.product) { result in
            switch result {
            case .success(let response):
                guard let metadata = ResponseParser.shared.parse(to: HomeData.self, from: response) else { return }
                self.output?.requestDidSuccess(metadata: metadata)
            case .failure(let err):
                self.output?.requestDidFailed(message: err.errorDescription ?? "")
            }
        }
    }
    
}
