//
//  LoginContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol LoginRouterProtocol: class {
    func navigateToMain()
}

protocol LoginPresenterProtocol: class {
    
    var entity: LoginEntity? { get set }
    func navigateToMain()
    
    func viewDidLoad()

}

protocol LoginInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol LoginInteractorInputProtocol: class {
    
    var output: LoginInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol LoginViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
