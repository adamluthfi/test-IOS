//
//  HeroDetailCollectionViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 23/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import Kingfisher

class HeroDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HeroDetailCollectionViewCell"
    
    @IBOutlet weak var heroDetailImage: UIImageView!
    
    var heroDetail: HeroEntity? {
        didSet {
            if let baseUrl = heroDetail?.icon {
                var urlImage = "https://api.opendota.com"
                urlImage += baseUrl
                guard let urlString = URL(string: urlImage) else { return }
                heroDetailImage.kf.setImage(with: urlString)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
