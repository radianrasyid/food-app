//
//  AppetizerOrderButton.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 29/06/24.
//

import Foundation
import SwiftUI

struct AppetizerOrderButton: View {
    let appetizer: AppetizerModel
    var body: some View {
        Text("$ \(appetizer.price, specifier: "%.2f") - Add to Cart")
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
    }
}
