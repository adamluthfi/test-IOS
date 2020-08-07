//
//  HomeContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol HomeRouterProtocol: class {
    func navigateToDetai(product: ProductPromo)
    func navigateToSearch()
}

protocol HomePresenterProtocol: class {
    
    var entity: HomeEntity? { get set }
    
    func viewDidLoad()
    func navigateToDetail(product: ProductPromo)
    func navigateToSearch()

}

protocol HomeInteractorOutputProtocol: class {
    
    func requestDidSuccess(metadata: HomeData)
    func requestDidFailed(message: String)
}

protocol HomeInteractorInputProtocol: class {
    
    var output: HomeInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol HomeViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData(data: HomeData)
    func showErrorMessage(message: String)
    
}
