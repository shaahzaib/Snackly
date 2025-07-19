//
//  SmallProductView.swift
//  Snackly
//
//  Created by Macbook Pro on 25/05/2025.
//

import SwiftUI

// small product view for cart

struct SmallProductView:View {
    
    @EnvironmentObject var cartManager:CartManager
   var product:Product
    
    var body: some View {
        
        
        ZStack{
            
            ZStack {
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -100)
                    .rotationEffect(Angle(degrees: 30))
                
                VStack(alignment: .leading, content: {
                    // name
                    Text("\(product.name)")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 100)
                    
                    //  category
                    Text("\(product.category)")
                        .font(.system(size: 15, weight: .semibold))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                        .font(.callout)
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 15,weight: .semibold))
                        
                        Spacer()
                        
                        
                        //purchase button
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45,height: 40)
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                        
                        
                    }.padding(.trailing,-12)
                    .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height:45)
                        .background(.white.opacity(0.8))
                        .clipShape(Capsule())
                    
                    
                    
                    //vstack
                })
                
            }.padding(20)
                .frame(width: 170, height: 215)
            
            
            //zstack
        }
        .padding()
        .frame(width: 170,height: 215)
        .background(product.color.opacity(0.15))
        .clipShape(.rect(cornerRadius: 35))
        .padding(.leading,10)
        
       
        
        
    }
}

#Preview {
    SmallProductView(product: Product(name: "Twister Chips", category: "chips", image: "chips1", price: 5, color: .purple))
        .environmentObject(CartManager())
}
