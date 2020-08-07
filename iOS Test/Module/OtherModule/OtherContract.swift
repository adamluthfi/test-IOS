//
//  OtherContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol OtherRouterProtocol: class {

}

protocol OtherPresenterProtocol: class {
    
    var entity: OtherEntity? { get set } 
    
    func viewDidLoad()

}

protocol OtherInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol OtherInteractorInputProtocol: class {
    
    var output: OtherInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol OtherViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
