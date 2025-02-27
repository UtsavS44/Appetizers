//
//  AccountView.swift
//  Appetizer
//
//  Created by Utsav  on 23/08/24.
//

import SwiftUI


struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.brithDate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    
                    }
                label:{
                    Text("Save Changes")
                }
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins",isOn: $viewModel.user.extraNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: .PrimaryColor))
                    Toggle("Frequent Refills",isOn: $viewModel.user.extraRefills)
                        .toggleStyle(SwitchToggleStyle(tint: .PrimaryColor))
                }
            }
                    .navigationTitle("😀 Account")
            
        }.onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,message: alertItem.message, dismissButton: alertItem.dismmisedButton)
        }
    }
}

#Preview {
    AccountView()
}
