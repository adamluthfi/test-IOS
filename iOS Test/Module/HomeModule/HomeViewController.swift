//
//  HomeViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var product: [ProductPromo]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var category: [Category]? {
        didSet {
            tableView.reloadData()
        }
    }
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
    @IBAction func buttonSearchAction(_ sender: Any) {
                presenter?.navigateToSearch()
    }
    
    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        let homeNib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        let homeHeaderNib = UINib(nibName: String(describing: HomeHeaderTableViewCell.self), bundle: nil)
        tableView.register(homeNib, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.register(homeHeaderNib, forCellReuseIdentifier: HomeHeaderTableViewCell.identifier)
        buttonSearch.layer.cornerRadius = 10.0
    }
}

// MARK: - View Protocol

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return product?.count ?? 0
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.identifier, for: indexPath) as! HomeHeaderTableViewCell
            cell.category = category
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
            cell.product = product?[indexPath.row]
            return cell
        default:
            fatalError("cannot find cell")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            guard let producDetail = product?[indexPath.row] else { return }
            presenter?.navigateToDetail(product: producDetail)
        default:
            break
        }
    }
    
    
}

extension HomeViewController: HomeViewProtocol {
    
    func populateData(data: HomeData) {
        DispatchQueue.main.async {
            self.product = data[0].data?.productPromo
            self.category = data[0].data?.category
        }
    }

    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            
        }
    }
}
