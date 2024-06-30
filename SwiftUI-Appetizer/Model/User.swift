//
//  User.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 30/06/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
