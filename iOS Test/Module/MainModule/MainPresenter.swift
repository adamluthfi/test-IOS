//
//  MainPresenter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol {

    weak private var view: MainViewProtocol?
    private let interactor: MainInteractorInputProtocol?
    private let router: MainRouterProtocol?

    var entity: MainEntity?
    
    init(interface: MainViewProtocol, interactor: MainInteractorInputProtocol?, router: MainRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: PresenterProtocol
    
    func itemTabBarController(_ completion: ([UIViewController]) -> Void) {
        router?.itemTabBarController(completion)
    }
    
    func viewDidLoad() {
        // TODO: Add on view loaded
        view?.showProgressDialog(show: true)
        interactor?.fetchData()
    }

}

extension MainPresenter: MainInteractorOutputProtocol {

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
