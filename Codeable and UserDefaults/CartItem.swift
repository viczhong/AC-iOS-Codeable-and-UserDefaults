//
//  CartItem.swift
//  Codeable and UserDefaults
//
//  Created by Louis Tur on 7/5/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import Foundation

struct CartItem: Codable {
    let name: String
    let sku: Int
    let price: Double

    // Note: Adding the Codable protocol to this struct results in losing a struct's free initializer
    // This is because Codable comes with an initiaizer: init(decoder:)
    init(name: String, sku: Int, price: Double) {
        self.name = name
        self.sku = sku
        self.price = price
    }
}

extension CartItem: Equatable {
    static func ==(lhs: CartItem, rhs: CartItem) -> Bool {
        if lhs.sku == rhs.sku {
            return true
        }

        return false
    }
}
