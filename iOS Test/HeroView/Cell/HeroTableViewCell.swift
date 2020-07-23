//
//  HeroTableViewCell.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    static let identifier: String = "HeroTableViewCell"

    @IBOutlet weak var nameHeroLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
    }
    
}
