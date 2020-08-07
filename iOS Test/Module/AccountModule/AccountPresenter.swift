//
//  AccountPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class AccountPresenter: AccountPresenterProtocol {
    
    weak private var view: AccountViewProtocol?
    private let interactor: AccountInteractorInputProtocol?
    private let router: AccountRouterProtocol?

    var entity: AccountEntity?
    
    init(interface: AccountViewProtocol, interactor: AccountInteractorInputProtocol?, router: AccountRouterProtocol) {
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

extension AccountPresenter: AccountInteractorOutputProtocol {

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
