//
//  ContentView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI
import SwiftData

struct AppetizerTabView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AppetizerAccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            AppetizerOrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .tint(Color("BrandPrimary"))
        
    }
}

#Preview {
    AppetizerTabView()
        .modelContainer(for: Item.self, inMemory: true)
}
