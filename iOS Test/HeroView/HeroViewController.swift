//
//  HeroViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import Kingfisher

class HeroViewController: UIViewController {
    
    var presenter: HeroPresenterProtocol?
    var heroRoles: [String] = ["Carry","Disabler","Durable","Escape","Initiator","Jungler","Nuker","Pusher","Support","All"]
    var heroStats: [HeroEntity]? {
        didSet {
            heroTableView.reloadData()
            heroCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var heroCollectionView: UICollectionView!{
        didSet {
            heroCollectionView.dataSource = self
            heroCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var heroTableView: UITableView! {
        didSet {
            heroTableView.dataSource = self
            heroTableView.delegate = self
        }
    }
    
    // MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        setupViews()
    }

    // MARK: - publics
    // Add public functions here

    // MARK: - IBActions
    // Add IBActions in this area
    
    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        let heroNib = UINib(nibName: HeroCollectionViewCell.identifier, bundle: nil)
        let categoryNib = UINib(nibName: HeroTableViewCell.identifier, bundle: nil)
        heroTableView.estimatedRowHeight = 20
        heroTableView.register(categoryNib, forCellReuseIdentifier: HeroTableViewCell.identifier)
        heroCollectionView.register(heroNib, forCellWithReuseIdentifier: HeroCollectionViewCell.identifier)
    }
}

// MARK: - View Protocol
extension HeroViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroStats?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCollectionViewCell.identifier, for: indexPath) as! HeroCollectionViewCell
        cell.hero = heroStats?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = heroCollectionView.bounds.width
        let cellWidth = (width - 30) / 3
        return CGSize(width: cellWidth, height: 150 / 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let heroDetail = heroStats?[indexPath.item] else { return }
        presenter?.navigateToDetail(heroDetail: heroDetail)
    }
}

extension HeroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroRoles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroTableViewCell.identifier, for: indexPath) as! HeroTableViewCell
        cell.nameHeroLabel.setTitle(heroRoles[indexPath.item], for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    
}
extension HeroViewController: HeroViewProtocol {
    func populateData(data: [HeroEntity]) {
        DispatchQueue.main.async {
            self.heroStats = data
        }
    }

    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            print("error data")
        }
    }
}
