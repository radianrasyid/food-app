//
//  AppetizerDetailView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 29/06/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: AppetizerModel
    @Binding var isShowed: Bool
    var body: some View {
        VStack{
            AppetizerDetailImage(imageURLString: appetizer.imageURL)
            
            AppetizerDetailInformation(appetizer: appetizer)
            
            Spacer()
            
            Button{
                print("tapped")
            }label: {
                AppetizerOrderButton(price: appetizer.price)
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button{
            withAnimation{
                isShowed = false
            }
        }label: {
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
            }
        }, alignment: .topTrailing)
    }
}

struct NutritionInformation: View {
    let nutritionTitle: String
    let nutritionInfo: Any
    var body: some View {
        VStack(spacing: 5){
            Text(nutritionTitle)
                .bold()
                .font(.caption)
            
            Text("\(nutritionInfo)")
                .fontWeight(.semibold)
                .font(.caption)
                .italic()
        }
    }
}

struct AppetizerDetailInformation: View {
    var appetizer: AppetizerModel
    var body: some View {
        VStack{
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40){
                NutritionInformation(nutritionTitle: "Calories", nutritionInfo: appetizer.calories)
                NutritionInformation(nutritionTitle: "Carbs", nutritionInfo: appetizer.carbs)
                NutritionInformation(nutritionTitle: "Protein", nutritionInfo: appetizer.protein)
            }
        }
    }
}

struct AppetizerDetailImage: View {
    let imageURLString: String
    var body: some View {
        AsyncImage(url: URL(string: imageURLString)){
            image in
            if (image.image != nil) {
                image.image?.resizable()
            }
            else if image.error != nil {
                Image("burger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
            }
            else {
                ProgressView()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 300, height: 225)
    }
}
