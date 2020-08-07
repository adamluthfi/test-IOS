//
//  SearchContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol SearchRouterProtocol: class {

}

protocol SearchPresenterProtocol: class {
    
    var entity: SearchEntity? { get set } 
    
    func viewDidLoad()

}

protocol SearchInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol SearchInteractorInputProtocol: class {
    
    var output: SearchInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol SearchViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
