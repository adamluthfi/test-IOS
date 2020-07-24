//
//  HeroRouter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

class HeroRouter: HeroRouterProtocol {

    weak var viewController: HeroViewController?

     // MARK: RouterProtocol
    func navigateToDetail(heroDetail: HeroEntity) {
        let vc = ModuleBuilder.shared.createHeroDetailViewController(heroDetail: heroDetail)
        vc.title = "Detail"
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
