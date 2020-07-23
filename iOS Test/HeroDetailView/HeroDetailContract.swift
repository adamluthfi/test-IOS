//
//  HeroDetailContract.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

protocol HeroDetailRouterProtocol: class {

}

protocol HeroDetailPresenterProtocol: class {
    
    var entity: HeroDetailEntity? { get set }
    func fetchData()
}

protocol HeroDetailInteractorOutputProtocol: class {
    
    func requestDidSuccess(metadata: [HeroEntity])
    func requestDidFailed(message: String)
}

protocol HeroDetailInteractorInputProtocol: class {
    
    var output: HeroDetailInteractorOutputProtocol? { get set }

    func fetchData()
    
}

protocol HeroDetailViewProtocol: class {
    
    // Presenter -> ViewController
    func populateData(data: [HeroEntity])
    func showErrorMessage(message: String)
    
}
