//
//  CartProductView.swift
//  Snackly
//
//  Created by Macbook Pro on 26/05/2025.
//

import SwiftUI

// cart product

struct CartProductView:View {
    
    @EnvironmentObject var cartManager: CartManager
    var  product:Product
    var body: some View {
        HStack(spacing: 20){
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60,height: 60)
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text("\(product.category)")
                    .font(.subheadline)
                    .opacity(0.5)
                
            })
         
            Spacer()
            
            HStack{
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }

                
                Text("$\(product.price).0")
                    .padding()
                    .background(.cyan.opacity(0.5))
                    .clipShape(Capsule())
                    .frame(width: 70)
                
                Button {
                    cartManager.removeFromCart(product: product)
                } label: {
                    Image(systemName: "minus")
                        .foregroundStyle(.black)
                }
                
            }
            
            
        }.padding()
        
        
    }
}

#Preview {
    CartProductView(product: Product(name: "Twister Chips", category: "chips", image: "chips1", price: 5, color: .purple))
        .environmentObject(CartManager())
}
