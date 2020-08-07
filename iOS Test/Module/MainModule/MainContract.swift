//
//  MainContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: class {
    func itemTabBarController(_ completion: (_ views: [UIViewController]) -> Void)
}

protocol MainPresenterProtocol: class {
    
    var entity: MainEntity? { get set }
    
    func itemTabBarController(_ completion: (_ views: [UIViewController]) -> Void)
    
    func viewDidLoad()

}

protocol MainInteractorOutputProtocol: class {
    
    func requestDidSuccess()
    func requestDidFailed(message: String)
}

protocol MainInteractorInputProtocol: class {
    
    var output: MainInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol MainViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData()
    func showProgressDialog(show: Bool)
    func showAlertMessage(title: String, message: String)
    func showErrorMessage(message: String)
    
}
