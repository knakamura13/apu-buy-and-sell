//
//  ItemViewVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/16/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class ItemViewVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize.height = 1000
    }
    
    @IBAction func unwindSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "returnFromModal", sender: self)
    }
    
}
