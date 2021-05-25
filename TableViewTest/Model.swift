//
//  Model.swift
//  TableViewTest
//
//  Created by Komal Gupta on 20/05/21.
//

import Foundation

struct list: Codable {
    let status: Int
    let message: String
    let result: [listData]
}

struct listData: Codable {
    let categoryId: String
    let name: String
    let parentCategory: String
    let result: [list_Data]
}

struct list_Data: Codable {
    let itemId: String
    let storeId: String
    let serviceTax: String
}


class Shared {
    static let shared = Shared()
    
    var navTitle = String()

    
}
