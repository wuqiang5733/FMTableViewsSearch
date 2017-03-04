//
//  MyTableViewController.swift
//  FMTableViewsSearch
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchItems: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchItems.delegate = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.filteredItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let data = AppData.filteredItems[indexPath.row]
        cell.textLabel?.text = data
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchItems.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            AppData.filterData(search: search)
            tableView.reloadData()
        }
    }
}
