//
//  CollectionView.swift
//  Snackly
//
//  Created by Macbook Pro on 25/05/2025.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager:CartManager
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    
                    HStack{
                        
                        Text("Delights in Every **Bite**!")
                            .font(.system(size: 30))
                        
                            .padding(.trailing)
                        Spacer()
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay(RoundedRectangle(cornerRadius:50).stroke().opacity(0.4))
                                .foregroundStyle(.black)
                        }
                        
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],
                              content:{
                        ForEach(productList, id: \.id){ item in
                            SmallProductView(product: item)
                                .environmentObject(cartManager)
                        }
                    })
                    
                    
                    
                }
            }
           
        }.navigationBarHidden(true)
    }
}

#Preview {
    CollectionView( )
        .environmentObject(CartManager())
}




