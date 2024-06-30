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
    static let formEmtpyValue = AlertItemCustomize(name: Text("Form Error"), error: Text("please fill all the required value"))
    static let emailFormError = AlertItemCustomize(name: Text("Email Error"), error: Text("please provide valid email"))
    static let userSaveError = AlertItemCustomize(name: Text("Server Error"), error: Text("something went wrong when saving your data"))
    static let userSaveSuccess = AlertItemCustomize(name: Text("Account Changed"), error: Text("your account info has been changed"))
    static let errorRetreivingUserData = AlertItemCustomize(name: Text("Server Error"), error: Text("something went wrong when retreiving your data from the server"))
}
