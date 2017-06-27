//
//  ItemViewVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/16/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class ItemViewVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var itemViewsLbl: UILabel!
    @IBOutlet weak var itemTimeLbl: UILabel!
    @IBOutlet weak var itemTitleLbl: UILabel!
    @IBOutlet weak var itemDescriptionLbl: UILabel!
    
    weak var delegate: ItemViewVCDelegate?  // Access selectedItem through `delegate?.selectedItems`
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize.height = 1050
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let tempItem = delegate?.selectedItem {
            backgroundImg.image = tempItem.backgroundImg
            userImg.image = tempItem.userImg
            priceLbl.text = tempItem.price
            itemTitleLbl.text = tempItem.itemTitle
            // set additional item values
        }
        // randomly generated values
        itemViewsLbl.text = "\(Int(arc4random_uniform(30) + 1)) views"
        let randomDays = Int(arc4random_uniform(10))
        if randomDays >= 0 && randomDays <= 7 {
            let randomHours = Int(arc4random_uniform(3))
            if randomHours == 0 {
                let randomMinutes = Int(arc4random_uniform(61))
                if randomMinutes == 0 {
                    let randomSeconds = Int(arc4random_uniform(59)+1)
                    if randomSeconds == 1 {
                        itemTimeLbl.text = "\(1) second ago"
                    } else {
                        itemTimeLbl.text = "\(randomSeconds) seconds ago"
                    }
                } else {
                    if randomMinutes == 1 {
                        itemTimeLbl.text = "\(1) minute ago"
                    } else {
                        itemTimeLbl.text = "\(randomMinutes) minutes ago"
                    }
                }
            } else {
                if randomHours == 1 {
                    itemTimeLbl.text = "\(1) hour ago"
                } else {
                    itemTimeLbl.text = "\(randomHours) hours ago"
                }
            }
        } else {
            itemTimeLbl.text = "\(1) day ago"
        }
    }
    
    @IBAction func unwindSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "returnFromModal", sender: self)
    }
}
