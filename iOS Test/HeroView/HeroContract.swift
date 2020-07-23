//
//  HeroContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol HeroRouterProtocol: class {
    func navigateToDetail(heroDetail: HeroEntity)
}

protocol HeroPresenterProtocol: class {
    
    var entity: HeroEntity? { get set }
    func fetchData()
    func navigateToDetail(heroDetail: HeroEntity)

}

protocol HeroInteractorOutputProtocol: class {
    
    func requestDidSuccess(metadata: [HeroEntity])
    func requestDidFailed(message: String)
}

protocol HeroInteractorInputProtocol: class {
    
    var output: HeroInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol HeroViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData(data: [HeroEntity])
    func showErrorMessage(message: String)
    
}
