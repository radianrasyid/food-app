//
//  FoodListCell.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 28/06/24.
//

import Foundation
import SwiftUI

struct FoodListCell: View {
    var appetizer: AppetizerModel
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: appetizer.imageURL)){ image in
                if image.image != nil {
                    image.image!.resizable()
                }else if image.error != nil{
                    Image(systemName: "fork.knife.circle.fill")
                        .tint(.accent)
                        .font(.system(size: 50))
                }else{
                    ProgressView()
                }
            }
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 19))
            .tint(.accent)
            
            VStack(alignment: .leading){
                Text(appetizer.name)
                    .font(.title3)
                    .padding(.top)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.leading)
            
        }
    }
}
