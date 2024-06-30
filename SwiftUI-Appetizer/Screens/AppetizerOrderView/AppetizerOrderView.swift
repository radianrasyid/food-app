//
//  AppetizerOrderView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI

struct AppetizerOrderView: View {
    
    @State private var orderedItems: [AppetizerModel] = MockData.orderSampleData
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(orderedItems){appetizer in
                        FoodListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Spacer()
                
                Button{
                    print("test")
                }label: {
                    AppetizerOrderButton(price: 10.0)
                }
                .padding(.bottom)
            }
            .navigationTitle("Order")
        }
    }
    
    func deleteItems(at offset: IndexSet){
        orderedItems.remove(atOffsets: offset)
    }
}

#Preview {
    AppetizerOrderView()
}
