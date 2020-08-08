//
//  LoginPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak private var view: LoginViewProtocol?
    private let interactor: LoginInteractorInputProtocol?
    private let router: LoginRouterProtocol?

    var entity: LoginEntity?
    
    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol
    func navigateToMain() {
        router?.navigateToMain()
    }

    func viewDidLoad() {
        // TODO: Add on view loaded
        view?.showProgressDialog(show: true)
        interactor?.fetchData()
    }

}

extension LoginPresenter: LoginInteractorOutputProtocol {

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
