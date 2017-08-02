//
//  Icon.swift
//  CollectionView
//
//  Created by Fomin Mykola on 8/2/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import Foundation

struct Icon {
    var name = ""
    var price = 0.0
    var isFeatured = false
    
    init(name: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.isFeatured = isFeatured
    }
}