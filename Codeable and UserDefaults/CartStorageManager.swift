//
//  CartStorageManager.swift
//  Codeable and UserDefaults
//
//  Created by Louis Tur on 7/5/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import Foundation

class CartStorageManager {
    let cart: Cart

    init(cart: Cart) {
        self.cart = cart
    }

    // Saves the cart to UserDefaults
    func saveCart() {
        let encodedCart = try! PropertyListEncoder().encode(self.cart)
        UserDefaults.standard.set(encodedCart, forKey: "userCartKey")
    }

    // Loads a Cart from UserDefaults if possible. If no cart is found stored in UserDefaults,
    // this returns an empty Cart
    class func loadCart() -> Cart {
        if let encodedCart = UserDefaults.standard.value(forKey: "userCartKey") as? Data {
            let cart = try!PropertyListDecoder().decode(Cart.self, from: encodedCart)
            return cart
        }

        return Cart(items: [])
    }
}
