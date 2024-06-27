//
//  AppetizerListView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack{
            List(MockData.appetizers){
                appetizer in
                FoodListCell(appetizer: appetizer)
                .onTapGesture {
                    print("asu")
                }
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
