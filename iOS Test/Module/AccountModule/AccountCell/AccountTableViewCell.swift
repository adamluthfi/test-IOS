//
//  AccountTableViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    static let identifier: String = "AccountTableViewCell"

    @IBOutlet weak var contentViewAccount: UIView!
    @IBOutlet weak var imageAccount: UIImageView!
    @IBOutlet weak var labelTitleAccount: UILabel!
    @IBOutlet weak var labelPriceLabel: UILabel!
    
    var product: ProductPromo? {
        didSet {
            if let urlImage = product?.imageURL {
                guard let url = URL(string: urlImage) else { return }
                imageAccount.kf.setImage(with: url)
            }
            
            if let title = product?.title, let price = product?.price {
                labelTitleAccount.text = title
                labelPriceLabel.text = price
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentViewAccount.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
