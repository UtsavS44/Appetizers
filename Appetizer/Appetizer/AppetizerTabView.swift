//
//  ContentView.swift
//  Appetizer
//
//  Created by Utsav  on 23/08/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.PrimaryColor)
        //.padding()
    }
}

#Preview {
    AppetizerTabView()
}
