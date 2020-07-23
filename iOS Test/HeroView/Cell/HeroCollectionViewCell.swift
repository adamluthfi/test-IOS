//
//  HeroCollectionViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import Kingfisher

class HeroCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HeroCollectionViewCell"

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    var hero: HeroEntity? {
        didSet {
            if let baseUrl = hero?.img {
                var urlImage = "https://api.opendota.com"
                urlImage += baseUrl
                guard let urlString = URL(string: urlImage) else { return }
                heroImage.kf.setImage(with: urlString)
            }
            
            if let nameHero = hero?.localizedName {
                heroName.text = nameHero
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
