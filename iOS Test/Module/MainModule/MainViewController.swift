//
//  MainViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
    }

    // MARK: - publics
    // Add public functions here

    // MARK: - IBActions
    // Add IBActions in this area

    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        self.tabBar.barTintColor = .white
        
        DispatchQueue.main.async {
            self.presenter?.itemTabBarController { views in
                self.viewControllers = views
            }
        }
    }
}

// MARK: - View Protocol
extension MainViewController: MainViewProtocol {
    func populateData() {
        // TODO: Populate data
    }

    func showProgressDialog(show: Bool) {
        DispatchQueue.main.async {
            
        }
    }

    func showAlertMessage(title: String, message: String) {
        DispatchQueue.main.async {
            
        }
    }

    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            
        }
    }
}
