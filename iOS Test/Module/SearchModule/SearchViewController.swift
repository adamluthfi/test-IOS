//
//  SearchViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var search:[SearchModel] = [SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Honda", price: "$500"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Toyota", price: "$300"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Mazda", price: "$1000"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Jeep", price: "$700"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "BMW", price: "$1100"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Ducati", price: "$10000"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Ford", price: "$600"),
    SearchModel(imgUrl: "https://e7.pngegg.com/pngimages/667/590/png-clipart-honda-logo-honda-motor-company-car-motorcycle-honda-angle-text.png", title: "Chevrolet", price: "$800")]
    
    var searchData: [SearchModel] = []
    var searchActive: Bool = false
    
    @IBOutlet weak var searchProduct: UISearchBar!
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
    }

    // MARK: - publics
    // Add public functions here

    // MARK: - IBActions
    // Add IBActions in this area
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        let searchNib = UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil)
        tableView.register(searchNib, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.reloadData()
        searchProduct.delegate = self
    }
}

// MARK: - View Protocol

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return searchData.count
        }
        return search.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        if searchActive {
            cell.search = searchData[indexPath.row]
        } else {
            cell.search = search[indexPath.row]
        }
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchActive = true
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchData = self.search.filter { (text) -> Bool in
            let tmp: NSString = text.title! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        }
        
        if self.searchData.count == 0 {
            self.searchActive = false
        } else {
            self.searchActive = true
        }
        
        self.tableView.reloadData()
        
    }
}

extension SearchViewController: SearchViewProtocol {
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
