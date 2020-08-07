//
//  HomePresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak private var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol?
    private let router: HomeRouterProtocol?

    var entity: HomeEntity?
    
    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol

    func viewDidLoad() {
        // TODO: Add on view loaded
        interactor?.fetchData()
    }
    
    func navigateToDetail(product: ProductPromo) {
        router?.navigateToDetai(product: product)
    }
    
    func navigateToSearch() {
        router?.navigateToSearch()
    }

}

extension HomePresenter: HomeInteractorOutputProtocol {
    // MARK: InteractorOutputProtocol
    
    func requestDidSuccess(metadata: HomeData) {
        view?.populateData(data: metadata)
    }

    func requestDidFailed(message: String) {
        view?.showErrorMessage(message: message)
    }

}
