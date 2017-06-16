//
//  Item.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/15/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    // Base variables
    fileprivate var _backgroundImg: UIImage = #imageLiteral(resourceName: "comic")
    fileprivate var _priceLbl: String = "$0"
    fileprivate var _usrImg: UIImage = #imageLiteral(resourceName: "icon-user")
    fileprivate var _itemTitle: String = "Item Title"
    
    // Getters
    var backgroundImg: UIImage {
        get {
            return _backgroundImg
        }
        set(value) {
            _backgroundImg = value
        }
    }
    var priceLbl: String {
        get {
            return _priceLbl
        }
        set(value) {
            _priceLbl = value
        }
    }
    var userImg: UIImage {
        get {
            return _usrImg
        }
        set(value) {
            _usrImg = value
        }
    }
    var itemTitleLbl: String {
        get {
            return _itemTitle
        }
        set(value) {
            _itemTitle = value
        }
    }
    
    // Initializer
    init(backgroundImage: UIImage, priceLabel: String, userImage: UIImage, itemTitle: String) {
        self._backgroundImg = backgroundImage
        self._priceLbl = priceLabel
        self._usrImg = userImage
        self._itemTitle = itemTitle
    }
}
