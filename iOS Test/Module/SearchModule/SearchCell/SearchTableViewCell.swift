//
//  SearchTableViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 07/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let identifier: String = "SearchTableViewCell"
    
    @IBOutlet weak var contentViewSearch: UIView!
    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var titleSearch: UILabel!
    @IBOutlet weak var priceSearch: UILabel!
    
    var search: SearchModel? {
        didSet {
            if let urlImage = search?.imgUrl {
                guard let url = URL(string: urlImage) else { return }
                imageSearch.kf.setImage(with: url)
            }
            
            if let title = search?.title {
                titleSearch.text = title
            }
            
            if let price = search?.price {
                priceSearch.text = price
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentViewSearch.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
