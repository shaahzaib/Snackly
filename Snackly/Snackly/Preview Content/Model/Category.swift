//
//  Category.swift
//  Snackly
//
//  Created by Macbook Pro on 24/05/2025.
//

import Foundation

struct Category:Identifiable,Hashable{
    
    var id:UUID = .init()
    var icon:String
    var title:String
    
    
    
}

var categoryList: [Category] = [
    
    Category(icon: "", title: "All"),
    Category(icon: "choco", title: "Choco"),
    Category(icon: "chips", title: "Chips"),
    Category(icon: "candy", title: "Candy"),
    
]
