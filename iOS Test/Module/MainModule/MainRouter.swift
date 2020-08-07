//
//  MainRouter.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import  UIKit

class MainRouter: MainRouterProtocol {

    weak var viewController: MainViewController?

     // MARK: RouterProtocol
    
    func itemTabBarController(_ completion: ([UIViewController]) -> Void) {
        
        let home = ModuleBuilder.shared.createHomeViewController()
        let homeTab = UINavigationController(rootViewController: home)
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        homeTab.tabBarItem.tag = 0
            
        let express = ModuleBuilder.shared.createOtherViewController()
        let expressTab = UINavigationController(rootViewController: express)
        expressTab.tabBarItem = UITabBarItem(title: "Express", image: nil, selectedImage: nil)
        expressTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        expressTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        expressTab.tabBarItem.tag = 1
            
        let event = ModuleBuilder.shared.createOtherViewController()
        let eventTab = UINavigationController(rootViewController: event)
        eventTab.tabBarItem = UITabBarItem(title: "Event", image: nil,selectedImage: nil)
        eventTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        eventTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        eventTab.tabBarItem.tag = 2
            
        let account = ModuleBuilder.shared.createAccountViewController()
        let accountTab = UINavigationController(rootViewController: account)
        accountTab.tabBarItem = UITabBarItem(title: "Account", image: nil, selectedImage: nil)
        accountTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        accountTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        accountTab.tabBarItem.tag = 3
        
        completion([homeTab, expressTab, eventTab, accountTab])
    }

}
