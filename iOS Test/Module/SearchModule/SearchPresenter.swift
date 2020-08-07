//
//  SearchPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    
    weak private var view: SearchViewProtocol?
    private let interactor: SearchInteractorInputProtocol?
    private let router: SearchRouterProtocol?

    var entity: SearchEntity?
    
    init(interface: SearchViewProtocol, interactor: SearchInteractorInputProtocol?, router: SearchRouterProtocol) {
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

extension SearchPresenter: SearchInteractorOutputProtocol {

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
