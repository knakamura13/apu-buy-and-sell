//
//  ItemListingsVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/15/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class ItemListingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ItemViewVCDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var selectedItem: Item? = nil
    var items: [Item?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var defaultItemsArray = [Item]()
        var tempItemImages = [#imageLiteral(resourceName: "item0"), #imageLiteral(resourceName: "item1"), #imageLiteral(resourceName: "item2"), #imageLiteral(resourceName: "item3"), #imageLiteral(resourceName: "item4")]
        var tempPrices = ["$300", "$115", "FREE", "$95", "$20"]
        var tempTitles = ["Nikon D3300 DSLR", "Bed Frame", "Well Used Couch", "Mini Fridge!", "HP Deskjet 1510 Printer"]
        var tempUserImages = [#imageLiteral(resourceName: "profile0"), #imageLiteral(resourceName: "profile1"), #imageLiteral(resourceName: "profile2"), #imageLiteral(resourceName: "profile3"), #imageLiteral(resourceName: "profile4")]
        
        for num in 0..<tempItemImages.count {
            let img = tempItemImages[num]
            let prc = tempPrices[num]
            let ttl = tempTitles[num]
            let usr = tempUserImages[num]
            
            defaultItemsArray.append(Item(backgroundImage: img, priceLabel: prc, userImage: usr, itemTitle: ttl))
        }
        items = defaultItemsArray
    }
    
    @IBAction func backFromModal(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 1    // Switch to the second tab (tabs are numbered 0, 1, 2)
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell {
            if let tempItem = items[indexPath.row] {
                cell.configureCell(tempItem.backgroundImg, priceLabel: tempItem.price, userImage: tempItem.userImg, itemTitleLabel: tempItem.itemTitle)
                return cell
            }
            return ItemCell()
        } else {
            return ItemCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = items[indexPath.row] {
            selectedItem = item
        }
        performSegue(withIdentifier: "itemClickedSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItem = nil
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let detailVc = segue.destination as? ItemViewVC {
            detailVc.delegate = self
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

protocol ItemViewVCDelegate: class {
    var selectedItem: Item? { get }
}
