//
//  ContentView.swift
//  Snackly
//
//  Created by Macbook Pro on 24/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                DashboardView()
                    .environmentObject(cartManager)
                
                if (cartManager.products.count > 0){
                    
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        HStack(spacing:30){
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.cyan.opacity(0.5))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text("Cart")
                                    .font(.system(size: 26,weight: .semibold))
                                
                                Text("\(cartManager.products.count) Item")
                                    .font(.system(size: 18))
                            }
                            
                            Spacer()
                            
                            ForEach(cartManager.products,id: \.name){item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                                
                            }
                            
                            
                            
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity)
                        .frame(height:80)
                        .background(.black)
                        .clipShape(.rect(topLeadingRadius: 60,topTrailingRadius: 60))
                        .foregroundStyle(.white)
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    
    }
        
    
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
