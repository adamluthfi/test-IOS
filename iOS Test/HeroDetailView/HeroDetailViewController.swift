//
//  HeroDetailViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    @IBOutlet weak var heroDetailImage: UIImageView!
    @IBOutlet weak var detailHeroCollection: UICollectionView! {
        didSet {
            detailHeroCollection.dataSource = self
            detailHeroCollection.delegate = self
        }
    }
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroRolesLabel: UILabel!
    @IBOutlet weak var swordLabel: UILabel!
    @IBOutlet weak var shieldLabel: UILabel!
    @IBOutlet weak var bootsLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var chemistryLabel: UILabel!
    @IBOutlet weak var chainLabel: UILabel!
    
    var presenter: HeroDetailPresenterProtocol?
    var heroEntity: HeroEntity?
    
    var heroDetail: [HeroEntity]? {
        didSet {
            detailHeroCollection.reloadData()
        }
    }
    
    // MARK: - Overrides
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
        let detailNIb = UINib(nibName: HeroDetailCollectionViewCell.identifier, bundle: nil)
        detailHeroCollection.register(detailNIb, forCellWithReuseIdentifier: HeroDetailCollectionViewCell.identifier)
        
        if let baseUrl = heroEntity?.img {
            var urlImage = "https://api.opendota.com"
            urlImage += baseUrl
            guard let urlString = URL(string: urlImage) else { return }
            heroDetailImage.kf.setImage(with: urlString)
        }
        
        if let nameHero = heroEntity?.localizedName {
            heroNameLabel.text = nameHero
        }
        
        if let rolesHero = heroEntity?.roles {
            heroRolesLabel.text = "Roles: " + rolesHero.map { $0.rawValue }.joined(separator: ", ")
        }
    }
}

// MARK: - View Protocol
extension HeroDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroDetailCollectionViewCell.identifier, for: indexPath) as! HeroDetailCollectionViewCell
        cell.heroDetail = heroDetail?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = detailHeroCollection.bounds.width
        let cellWidth = (width - 30) / 3
        return CGSize(width: cellWidth, height: 50 / 1)
    }
}

extension HeroDetailViewController: HeroDetailViewProtocol {
    
    func populateData(data: [HeroEntity]) {
        DispatchQueue.main.async {
            self.heroDetail = data
        }
    }
    
    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            
        }
    }
}
