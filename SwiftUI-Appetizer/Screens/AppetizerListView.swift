//
//  AppetizerListView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var vm = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                
                List(vm.appetizers){
                    appetizer in
                    FoodListCell(appetizer: appetizer)
                    .onTapGesture {
                        print("[UActivity]: user tapped \(appetizer.name)")
                    }
                }
                .navigationTitle("🍟 Appetizers")
            }
            
            if(vm.isAppetizerLoading){
                ProgressView()
            } 
        }
        .onAppear{
            vm.getAppetizers()
        }
        .alert(vm.alertItem?.name ?? Text("Error"), isPresented: $vm.isError, presenting: vm.alertItem){
            alert in
            Button(role: .destructive){
                
            }label: {
                Text("cancel")
            }
        }message: { alert in
            alert.error
        }
    }
    
}

#Preview {
    AppetizerListView()
}
