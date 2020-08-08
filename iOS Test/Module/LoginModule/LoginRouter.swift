//
//  LoginRouter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//
import UIKit
class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: LoginViewController?

     // MARK: RouterProtocol
    
    func navigateToMain() {
        let vc = ModuleBuilder.shared.createMainViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}
