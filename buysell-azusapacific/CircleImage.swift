//
//  CircleImage.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/16/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.customInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.customInit();
    }
    
    func customInit() {
        self.layer.cornerRadius = CGFloat(Int(round(layer.frame.size.width/2.0)))
    }
}
