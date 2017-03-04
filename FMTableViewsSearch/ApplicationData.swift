//
//  ApplicationData.swift
//  FMTableViewsSearch
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import Foundation

struct ApplicationData {
    var items: [String]
    var filteredItems: [String] = []
    
    init() {
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        filterData(search: "")
    }
    mutating func filterData(search: String) {
        if search == "" {
            filteredItems = items
        } else {
            filteredItems = items.filter({ (item) in
                let value1 = item.lowercased()
                let value2 = search.lowercased()
                let valid = value1.hasPrefix(value2)
                return valid
            })
        }
        filteredItems.sort(by: { (value1, value2) in value1 < value2 })
    }
}
var AppData = ApplicationData()
