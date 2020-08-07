//
//  OtherPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class OtherPresenter: OtherPresenterProtocol {
    
    weak private var view: OtherViewProtocol?
    private let interactor: OtherInteractorInputProtocol?
    private let router: OtherRouterProtocol?

    var entity: OtherEntity?
    
    init(interface: OtherViewProtocol, interactor: OtherInteractorInputProtocol?, router: OtherRouterProtocol) {
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

extension OtherPresenter: OtherInteractorOutputProtocol {

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
