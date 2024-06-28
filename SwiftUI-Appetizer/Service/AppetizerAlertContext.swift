//
//  AlertContext.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 28/06/24.
//

import Foundation
import SwiftUI

struct AlertItemCustomize: Identifiable {
    let id = UUID()
    let name: Text
    let error: Text
}

struct AppetizerAlertContext{
    static let invalidResponse  = AlertItemCustomize(name: Text("Server Error"), error: Text("invalid response"))
    static let invalidURL       = AlertItemCustomize(name: Text("Server Error"), error: Text("problem error when creating URL"))
    static let invalidData      = AlertItemCustomize(name: Text("Server Error"), error: Text("data retreived from the response is invalid"))
    static let unableToComplete = AlertItemCustomize(name: Text("Server Error"), error: Text("error occured when processing api"))
}
