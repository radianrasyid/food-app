//
//  AppetizerAccountViewModel.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 30/06/24.
//

import Foundation
import SwiftUI

@MainActor
final class AppetizerAccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user: User = User()
    @Published var alertItem: AlertItemCustomize?
    @Published var isError: Bool = false
    
    
    func retreiveUser(){
        guard let userData = userData else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
            
        }
        catch{
            self.isError = true
            self.alertItem = AppetizerAlertContext.errorRetreivingUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.isError = true
            self.alertItem = AppetizerAlertContext.formEmtpyValue
            return false
        }
        
        guard user.email.isValidEmail else {
            self.isError = true
            self.alertItem = AppetizerAlertContext.emailFormError
            return false
        }
        
        return true
    }
    
    func SaveChanges(){
        guard isValidForm else {return}
        
        print("changes saved successfully")
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            self.isError = true
            self.alertItem = AppetizerAlertContext.userSaveSuccess
        }
        catch{
            self.isError = true
            self.alertItem = AppetizerAlertContext.userSaveError
            return
        }
    }
}
