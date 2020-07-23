//
//  HeroPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class HeroPresenter: HeroPresenterProtocol {
    
    weak private var view: HeroViewProtocol?
    private let interactor: HeroInteractorInputProtocol?
    private let router: HeroRouterProtocol?

    var entity: HeroEntity?
    
    init(interface: HeroViewProtocol, interactor: HeroInteractorInputProtocol?, router: HeroRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol
    func navigateToDetail(heroDetail: HeroEntity) {
        router?.navigateToDetail(heroDetail: heroDetail)
    }
    
    func fetchData() {
        interactor?.fetchData()
    }

}

extension HeroPresenter: HeroInteractorOutputProtocol {

    // MARK: InteractorOutputProtocol
    
    func requestDidSuccess(metadata: [HeroEntity]) {
        view?.populateData(data: metadata)
    }

    func requestDidFailed(message: String) {
        view?.showErrorMessage(message: message)
    }

}
