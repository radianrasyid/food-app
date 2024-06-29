//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 28/06/24.
//

import Foundation

@MainActor class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerModel] = []
    @Published var alertItem: AlertItemCustomize?
    @Published var isError: Bool = false
    @Published var isAppetizerLoading: Bool = true
    @Published var isShowingDetail: Bool = false
    var selectedAppetizer: AppetizerModel?
    
    
    func getAppetizers(){
        isAppetizerLoading = true
        NetworkManagerService.shared.getAppetizers(completed: {
            result in
            DispatchQueue.main.async{
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    self.isAppetizerLoading = false
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        self.isError = true
                        self.alertItem = AppetizerAlertContext.invalidData
                        self.isAppetizerLoading = false
                    case.invalidResponse:
                        self.isError = true
                        self.alertItem = AppetizerAlertContext.invalidResponse
                        self.isAppetizerLoading = false
                    case.invalidURL:
                        self.isError = true
                        self.alertItem = AppetizerAlertContext.invalidURL
                        self.isAppetizerLoading = false
                    case.unableToComplete:
                        self.isError = true
                        self.alertItem = AppetizerAlertContext.unableToComplete
                        self.isAppetizerLoading = false
                    }
//                    print(error.localizedDescription)
                }
            }
        })
    }
}
