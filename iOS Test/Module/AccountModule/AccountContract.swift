//
//  AccountContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol AccountRouterProtocol: class {

}

protocol AccountPresenterProtocol: class {
    
    var entity: AccountEntity? { get set } 
    
    func viewDidLoad()

}

protocol AccountInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol AccountInteractorInputProtocol: class {
    
    var output: AccountInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol AccountViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
