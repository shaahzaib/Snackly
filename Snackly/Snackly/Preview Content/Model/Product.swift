//
//  Product.swift
//  Snackly
//
//  Created by Macbook Pro on 24/05/2025.
//

import Foundation
import SwiftUI

struct Product:Identifiable{
    var id: UUID = .init()
    var name : String
    var category : String
    var image : String
    var price : Int
    var color:Color
    
}


var productList = [
    
    
    Product(name: "Twister Chips", category: "chips", image: "chips1", price: 5, color: .purple),
    Product(name: "Crispy Potato Chips", category: "chips", image: "chips2", price: 4, color: .red),
    Product(name: "Spicy Nachos", category: "chips", image: "chips3", price: 6, color: .green),
    Product(name: "Cheesy Bites", category: "chips", image: "chips4", price: 5, color: .orange),
    Product(name: "Classic Salted Chips", category: "chips", image: "chips5", price: 3, color: .blue),
    Product(name: "Milk Choco Bar", category: "choco", image: "choco1", price: 3, color: .brown),
    Product(name: "Dark Delight", category: "choco", image: "choco2", price: 4, color: .pink),
    Product(name: "White Choco Treat", category: "choco", image: "choco3", price: 5, color: .green),
    Product(name: "Hazelnut Bliss", category: "choco", image: "choco4", price: 6, color: .purple),
    Product(name: "Gummy Bears", category: "candy", image: "candy1", price: 2, color: .blue),
    Product(name: "Fruit Chews", category: "candy", image: "candy2", price: 3, color: .blue),
    Product(name: "Caramel Swirl", category: "candy", image: "candy3", price: 1, color: .orange),
    Product(name: "Skittles", category: "candy", image: "candy4", price: 2, color: .red),
    Product(name: "Sour Strips", category: "candy", image: "candy5", price: 3, color: .yellow),



    
]
