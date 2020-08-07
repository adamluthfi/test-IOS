//
//  HomeRouter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: HomeViewController?

     // MARK: RouterProtocol
    func navigateToDetai(product: ProductPromo) {
        let vc = ModuleBuilder.shared.createDetailViewController(product: product)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToSearch() {
        let vc = ModuleBuilder.shared.createSearchViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}
