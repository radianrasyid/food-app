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
            if(vm.isAppetizerLoading){
                ProgressView()
                    .navigationTitle("🍟 Appetizers")
            }
            
            if(!vm.isAppetizerLoading && !vm.appetizers.isEmpty){
                NavigationStack{
                    List(vm.appetizers){
                        appetizer in
                        FoodListCell(appetizer:
                                appetizer)
                        .disabled(vm.isShowingDetail)
                        .onTapGesture {
                            withAnimation{
                                vm.selectedAppetizer = appetizer
                                vm.isShowingDetail = true
                            }
                            print("[UActivity]: user tapped \(appetizer.name)")
                        }
                    }
                    .navigationTitle("🍟 Appetizers")
                    .disabled(vm.isShowingDetail)
                }
                .blur(radius: vm.isShowingDetail ? 20 : 0)
                
                if vm.isShowingDetail  {
                    AppetizerDetailView(appetizer: vm.selectedAppetizer!, isShowed: $vm.isShowingDetail)
                        .transition(.move(edge: .bottom))
                }
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
