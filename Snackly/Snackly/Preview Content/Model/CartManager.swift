//
//  CartManager.swift
//  Snackly
//
//  Created by Macbook Pro on 25/05/2025.
//

import Foundation

class CartManager:ObservableObject{
    
    @Published private(set) var products:[Product] = []
    @Published private(set) var totalAmount:Int = 0
    
    func addToCart(product: Product){
        products.append(product)
        totalAmount += product.price
    }
    
    func removeFromCart(product: Product)
    {
        products = products.filter{$0.id != product.id}
        totalAmount -= product.price
    }
}
