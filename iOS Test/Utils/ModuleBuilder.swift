//
//  ModuleBuilder.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation

class ModuleBuilder {
    static let shared = ModuleBuilder()
    
    private init() {}
    
    func createHomeViewController() -> HomeViewController {
        let view = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    func createOtherViewController() -> OtherViewController {
        let view = OtherViewController(nibName: String(describing: OtherViewController.self), bundle: nil)
        let interactor = OtherInteractor()
        let router = OtherRouter()
        let presenter = OtherPresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    func createMainViewController() -> MainViewController {
        let view = MainViewController(nibName: String(describing: MainViewController.self), bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    func createDetailViewController(product: ProductPromo) -> DetailViewController {
        let view = DetailViewController(nibName: String(describing: DetailViewController.self), bundle: nil)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router)
        view.product = product
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    func createSearchViewController() -> SearchViewController {
        let view = SearchViewController(nibName: String(describing: SearchViewController.self), bundle: nil)
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
