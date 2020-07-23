//
//  HeroDetailPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class HeroDetailPresenter: HeroDetailPresenterProtocol {
    
    weak private var view: HeroDetailViewProtocol?
    private let interactor: HeroDetailInteractorInputProtocol?
    private let router: HeroDetailRouterProtocol?

    var entity: HeroDetailEntity?
    
    init(interface: HeroDetailViewProtocol, interactor: HeroDetailInteractorInputProtocol?, router: HeroDetailRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol
    func fetchData() {
        interactor?.fetchData()
    }
}

extension HeroDetailPresenter: HeroDetailInteractorOutputProtocol {

    // MARK: InteractorOutputProtocol
    func requestDidSuccess(metadata: [HeroEntity]) {
        view?.populateData(data: metadata)
    }
    func requestDidFailed(message: String) {
        view?.showErrorMessage(message: message)
    }

}
