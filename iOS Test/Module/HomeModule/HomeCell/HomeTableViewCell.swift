//
//  HomeTableViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    static let identifier: String = "HomeTableViewCell"
    
    @IBOutlet weak var contentViewProduct: UIView!
    @IBOutlet weak var imageGoods: UIImageView!
    @IBOutlet weak var imageLike: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var product: ProductPromo? {
        didSet {
            if let name = product?.title {
                self.labelTitle.text = name
            }
            
            if let urlString = product?.imageURL {
                guard  let urlImage = URL(string: urlString) else {
                    return
                }
                self.imageGoods.kf.setImage(with: urlImage)
            }
            
            if let loveIt = product?.loved {
                if loveIt == 1 {
                    self.imageLike.image = UIImage(named: "ic_love_selected")
                } else {
                    self.imageLike.image = UIImage(named: "ic_love_normal")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentViewProduct.layer.cornerRadius = 10.0
        imageGoods.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
