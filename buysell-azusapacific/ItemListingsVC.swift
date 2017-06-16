//
//  ItemListingsVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/15/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class ItemListingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var inSearchMode = false
    var filteredItems = [Item]()
    var limitedItems = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
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
        limitedItems = defaultItemsArray
    }
    
    @IBAction func backFromModal(segue: UIStoryboardSegue) {
        print("and we are back")
        // Switch to the second tab (tabs are numbered 0, 1, 2)
        self.tabBarController?.selectedIndex = 1
    }
    
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(limitedItems[indexPath.row].itemTitleLbl)
        performSegue(withIdentifier: "itemClickedSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell {
            var currentItem: Item
            if inSearchMode {
                currentItem = filteredItems[indexPath.row]
            } else {
                currentItem = limitedItems[indexPath.row]
            }
            cell.configureCell(currentItem.backgroundImg, priceLabel: currentItem.priceLbl, userImage: currentItem.userImg, itemTitleLabel: currentItem.itemTitleLbl)
            return cell
        } else {
            return ItemCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredItems.count
        } else {
            return limitedItems.count        // only ever returns two items
        }
    }
}
