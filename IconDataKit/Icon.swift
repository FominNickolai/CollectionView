//
//  Icon.swift
//  CollectionView
//
//  Created by Fomin Mykola on 8/2/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import Foundation

public struct Icon {
    public var name = ""
    public var price = 0.0
    public var imageName = ""
    public var description = ""
    public var isFeatured = false
    
    public init(name: String, imageName: String, description: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
        self.isFeatured = isFeatured
    }
}

