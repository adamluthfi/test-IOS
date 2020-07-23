//
//  HeroInteractor.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class HeroInteractor: HeroInteractorInputProtocol {
    
    weak var output: HeroInteractorOutputProtocol?
    let provider = NetworkManager<ApiConstant>(verbose: true)
    
    func fetchData() {
        provider.api().request(.heroStats) { result in
            switch result {
            case .success(let response):
                guard let metadata = ResponseParser.shared.parse(to: HeroStats.self, from: response) else { return }
                self.output?.requestDidSuccess(metadata: metadata)
            case .failure(let err):
                self.output?.requestDidFailed(message: err.errorDescription ?? "")
            }
        }
    }
    
}
