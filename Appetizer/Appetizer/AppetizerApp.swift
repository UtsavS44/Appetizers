//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Utsav  on 23/08/24.
//

import SwiftUI

@main
struct AppetizerApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
