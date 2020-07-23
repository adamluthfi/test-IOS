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
    
    func createHeroViewController() -> HeroViewController {
        let view = HeroViewController(nibName: String(describing: HeroViewController.self), bundle: nil)
        let interactor = HeroInteractor()
        let router = HeroRouter()
        let presenter = HeroPresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    func createHeroDetailViewController(heroDetail: HeroEntity) -> HeroDetailViewController {
        let view = HeroDetailViewController(nibName: String(describing: HeroDetailViewController.self), bundle: nil)
        let interactor = HeroDetailInteractor()
        let router = HeroDetailRouter()
        let presenter = HeroDetailPresenter(interface: view, interactor: interactor, router: router)
        view.presenter = presenter
        view.heroEntity = heroDetail
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
