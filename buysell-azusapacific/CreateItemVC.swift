//
//  CreateItemVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/21/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class CreateItemVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageOnePressed(_ sender: Any) {
        chooseNewImage()
    }
    
    @IBAction func imageTwoPressed(_ sender: Any) {
        chooseNewImage()
    }
    
    @IBAction func imageThreePressed(_ sender: Any) {
        chooseNewImage()
    }
    
    func chooseNewImage() {
        print("KYLE: it's working")
        performSegue(withIdentifier: "chooseNewImageSegue", sender: self)
    }
    
}
