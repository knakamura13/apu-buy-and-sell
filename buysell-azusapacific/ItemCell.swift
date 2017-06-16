//
//  ItemCell.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/15/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var usrImg: UIImageView!
    @IBOutlet weak var itemTitleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ backgroundImage: UIImage, priceLabel: String, userImage: UIImage, itemTitleLabel: String) {
        backgroundImg.image = backgroundImage
        priceLbl.text = priceLabel
        usrImg.image = userImage
        itemTitleLbl.text = itemTitleLabel
    }
}
