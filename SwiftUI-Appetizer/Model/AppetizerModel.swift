//
//  AppetizerModel.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import Foundation

struct AppetizerModel: Codable, Identifiable, Hashable {
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

struct MockData {
    static let sampleAppetizer = AppetizerModel(
        id: 0001,
        name: "Test appetizer",
        description: "This is the description for my appetizer. It's yummy",
        price: 9.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        calories: 9,
        protein: 9,
        carbs: 9
    )
    
    static let orderSampleData = [
        AppetizerModel(
            id: 0001,
            name: "Test appetizer",
            description: "This is the description for my appetizer. It's yummy",
            price: 9.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
            calories: 9,
            protein: 9,
            carbs: 9
        ),
        AppetizerModel(
            id: 0002,
            name: "Test appetizer",
            description: "This is the description for my appetizer. It's yummy",
            price: 9.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
            calories: 9,
            protein: 9,
            carbs: 9
        ),
        AppetizerModel(
            id: 0003,
            name: "Test appetizer",
            description: "This is the description for my appetizer. It's yummy",
            price: 9.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
            calories: 9,
            protein: 9,
            carbs: 9
        )
    ]
    
    static let appetizers = [
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
    ]
}
