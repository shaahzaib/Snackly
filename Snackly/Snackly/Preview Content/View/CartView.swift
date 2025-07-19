//
//  CartView.swift
//  Snackly
//
//  Created by Macbook Pro on 25/05/2025.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var cartManager:CartManager
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    
                    HStack{
                        
                        Text("**Cart**")
                            .font(.system(size: 30))
                        
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Text("\(cartManager.products.count)")
                            .padding()
                            .frame(width: 50,height: 70)
                            .background(.cyan.opacity(0.5))
                            .cornerRadius(40)
                            .foregroundStyle(.black)
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                          
                                
                                Image(systemName: "arrow.left")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 60,height: 80)
                                    .overlay(RoundedRectangle(cornerRadius:50).stroke().opacity(0.4))
                                    .foregroundStyle(.black)
                            
                        }
                        
                        
                    } 
                    .padding(30)
                    
                    // cartProduct
                    ForEach(cartManager.products, id: \.name){item in
                        CartProductView(product: item)
                    }
                    
                    //total amount
                    
                    VStack(alignment: .leading ){
                        HStack{
                            Text("Delivery Fees")
                            Spacer()
                            
                            Text("Free")
                                .font(.system(size: 24,weight: .semibold))
                        }
                        
                        Divider()
                        Text("Total Amount")
                        Text("$\(cartManager.totalAmount).0")
                            .font(.system(size: 36,weight: .semibold))
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.cyan.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    // payment button
                     
                    Button {
                        
                    } label: {
                        Text("Make Payment")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.cyan.opacity(0.5))
                            .clipShape(Capsule())
                            .padding()
                    }

                    
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}



