//
//  Alert.swift
//  Appetizer
//
//  Created by Utsav  on 29/08/24.
//

import Foundation
import SwiftUI
struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismmisedButton: Alert.Button
    @EnvironmentObject var order: Order
}
struct AlertContext{
    //MARK: - Network Alert
    static let invalidData =  AlertItem(title: Text("Server Errors"), message: Text("Data recived from the server was invalid"), dismmisedButton: .default(Text("OK")))
    
    static let invalidResponse =   AlertItem(title: Text("Server Errors"), message: Text("Invalid respinse from the server"), dismmisedButton: .default(Text("OK")))
    
    static let invalidURL =   AlertItem(title: Text("Server Errors"), message: Text("Issue connecting to the server"), dismmisedButton: .default(Text("OK")))
    
    static let unableToComplete =   AlertItem(title: Text("Server Errors"), message: Text("Unable to complete your request"), dismmisedButton: .default(Text("OK")))
    
    //MARK: - Account Alert
    static let invalidForm =   AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all the form have been filled"), dismmisedButton: .default(Text("OK")))
    static let invalidEmail =   AlertItem(title: Text("Invald Email"), message: Text("Please check your email"), dismmisedButton: .default(Text("OK")))
    static let userSaveSuccess =   AlertItem(title: Text("Data Saved"), message: Text("Your profile information was saved successfully"), dismmisedButton: .default(Text("OK")))
    static let invalidUserData =   AlertItem(title: Text("Profile Error"), message: Text("There was error saving or retrieving your profile"), dismmisedButton: .default(Text("OK")))
//    static let orderSuccess = AlertItem(title: Text("Order Was Successfull"), message: Text(" Your order of \(order.totalPrice,specifier: "%.2f") was sucessfull. Bon Apetite"), dismmisedButton: .default(Text("OK")))
}
