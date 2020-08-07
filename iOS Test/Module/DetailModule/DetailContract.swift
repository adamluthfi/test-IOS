//
//  DetailContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol DetailRouterProtocol: class {

}

protocol DetailPresenterProtocol: class {
    
    var entity: DetailEntity? { get set } 
    
    func viewDidLoad()

}

protocol DetailInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol DetailInteractorInputProtocol: class {
    
    var output: DetailInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol DetailViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
