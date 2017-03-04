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
        // 这个方法每次 reloadData() 运行的时候，都会执行
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let data = AppData.filteredItems[indexPath.row]
        cell.textLabel?.text = data
        print("WQ_Executed")
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchItems.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            AppData.filterData(search: search)
            tableView.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // 显示出右边的 “ Cancel "
        searchItems.setShowsCancelButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // 当点击右边的 " Cancel " 时
        searchItems.text = ""  // 清空输入内容
        searchItems.setShowsCancelButton(false, animated: true) // 以动态的方式隐藏 "Cancel"
        searchItems.resignFirstResponder()  // 隐藏输入键盘
        
        AppData.filterData(search: "")
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
