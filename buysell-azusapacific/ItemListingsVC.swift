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
    var limitedItems = defaultItemsArray

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

        // Do any additional setup after loading the view.
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
