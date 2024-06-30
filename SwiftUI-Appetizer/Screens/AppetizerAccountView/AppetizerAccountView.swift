//
//  AppetizerAccountView.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI

struct AppetizerAccountView: View {
    
    @StateObject var vm = AppetizerAccountViewModel()
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $vm.user.firstName)
                    TextField("Last Name", text: $vm.user.lastName)
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $vm.user.birthday, displayedComponents: .date)
                    Button{
                        vm.SaveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Request")){
                    Toggle("Extra Napkins", isOn: $vm.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $vm.user.frequentRefills)
                }
                .tint(.accentColor)
            }
            .navigationTitle("👨🏻‍💻 Account")
        }
        .onAppear{
            vm.retreiveUser()
        }
        .alert(vm.alertItem?.name ?? Text("Error"), isPresented: $vm.isError, presenting: vm.alertItem){
            alert in
            Button(role: .destructive){
                
            }label: {
                Text("OK")
            }
        }message: { alert in
            alert.error
        }
    }
}

#Preview {
    AppetizerAccountView()
}
