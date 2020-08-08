//
//  AccountViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import RealmSwift

class AccountViewController: UIViewController {
    
    var presenter: AccountPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var productList: Results<ProductPromo>? {
        didSet {
            tableView.reloadData()
        }
    }
    // MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let realm = try! Realm()
        self.productList = realm.objects(ProductPromo.self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let realm = try! Realm()
        self.productList = realm.objects(ProductPromo.self)
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
        let accountNib = UINib(nibName: String(describing: AccountTableViewCell.self), bundle: nil)
        tableView.register(accountNib, forCellReuseIdentifier: AccountTableViewCell.identifier)
    }
}

// MARK: - View Protocol
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as! AccountTableViewCell
        cell.product = productList?[indexPath.item]
        return cell
    }
}

extension AccountViewController: AccountViewProtocol {
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
