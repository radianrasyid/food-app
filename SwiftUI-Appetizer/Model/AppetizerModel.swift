//
//  AppetizerModel.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import Foundation

struct AppetizerModel: Codable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Codable {
    let request: [AppetizerModel]
}
