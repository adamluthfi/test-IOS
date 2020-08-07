//
//  DetailPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    weak private var view: DetailViewProtocol?
    private let interactor: DetailInteractorInputProtocol?
    private let router: DetailRouterProtocol?

    var entity: DetailEntity?
    
    init(interface: DetailViewProtocol, interactor: DetailInteractorInputProtocol?, router: DetailRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol

    func viewDidLoad() {
        // TODO: Add on view loaded
        view?.showProgressDialog(show: true)
        interactor?.fetchData()
    }

}

extension DetailPresenter: DetailInteractorOutputProtocol {

    // MARK: InteractorOutputProtocol

    func requestDidSuccess() {
        view?.showProgressDialog(show: false)
        view?.populateData()
    }

    func requestDidFailed(message: String) {
        view?.showProgressDialog(show: false)
        view?.showErrorMessage(message: message)
    }

}
