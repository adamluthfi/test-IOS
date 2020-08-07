//
//  HomeCollectionViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HomeCollectionViewCell"
    
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var labelTitleCategory: UILabel!
    
    var category: Category? {
        didSet {
            if let urlImage = category?.imageURL {
                guard let urlString = URL(string: urlImage) else {
                    return
                }
                self.imageCategory.kf.setImage(with: urlString)
            }
            
            if let titleCategory = category?.name {
                self.labelTitleCategory.text = titleCategory
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
