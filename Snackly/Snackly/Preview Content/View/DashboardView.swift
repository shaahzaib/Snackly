//
//  DashboardView.swift
//  Snackly
//
//  Created by Macbook Pro on 24/05/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @State var selectedCategory = ""
    @EnvironmentObject var cartManager:CartManager
    
    var body: some View {
        NavigationView {
            ScrollView{
                
                VStack{
                    
                    HStack{
                        
                        Text("Delights in Every **Bite**!")
                            .font(.system(size: 30))
                        
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay(RoundedRectangle(cornerRadius:50).stroke().opacity(0.4))
                        
                    }
                    .padding(30)
                    
                    // catrgories
                    CategoryListView
                    
                    HStack{
                        if (selectedCategory=="" || selectedCategory=="All"){
                            Text("All") .font(.system(size:25))
                        }else{
                            Text("\(selectedCategory) **Collections**")
                                .font(.system(size:25))
                        }
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right").imageScale(.large)
                        }
                        .foregroundStyle(.black)
                        
                        
                        
                    }.padding(.horizontal,30)
                        .padding(.vertical,15)
                    
                    
                    // productList
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack {
                            ForEach(productList,id: \.id){item in
                                    ProductView(product: item)
                                        .environmentObject(cartManager)
                                
                            }
                        
                        }
                    }
                    
                    
                    
                    //vstack
                }
                
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    
    
    var CategoryListView:some View{
        
        HStack{
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(categoryList,id: \.id){ item in
                        
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack{
                                if item.title != "All"{
                                   
                                    Image(item.icon).foregroundStyle(selectedCategory == item.title ? .yellow : .black)
                                        
                                }
                                if item.title == "All"{
                                    Text(item.title)
                                }
                                else{
                                    Text( selectedCategory == item.title ? item.title: "")}
                            }.padding(20)
                                .background(selectedCategory == item.title ? .cyan.opacity(0.7) : .gray.opacity(0.2))
                                .foregroundColor(selectedCategory == item.title ? .white : .black)
                                .clipShape(Capsule())
                            
                        }
                        
                    }
                }
                .padding(.horizontal,30)
            }
        }
    }
    
    
    
    
    
}

#Preview {
    DashboardView()
        .environmentObject(CartManager())
}



struct ProductView:View {
    
    @EnvironmentObject var cartManager:CartManager
    var product:Product
    
    var body: some View {
        
        
        ZStack{
            
            ZStack {
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -90)
                    .rotationEffect(Angle(degrees: 28))
                
                VStack(alignment: .leading, content: {
                    // name
                    Text("\(product.name)")
                        .font(.system(size: 30, weight: .semibold))
                        .frame(width: 140)
                    
                    //  category
                    Text("\(product.category)")
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                        .font(.callout)
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 24,weight: .semibold))
                        
                        Spacer()
                        
                        
                        //purchase button
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90,height: 70)
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                        
                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .frame(height:80)
                        .background(.white.opacity(0.8))
                        .clipShape(Capsule())
                    
                    
                    
                    //vstack
                })
                .padding()
            }
            
            
            //zstack
        }
        .padding()
        .frame(width: 330,height: 420)
        .background(product.color.opacity(0.15))
        .clipShape(.rect(cornerRadius: 55))
        .padding(.leading,20)
        
        
        
    }
}



