//
//  Appetizer.swift
//  Appetizer
//
//  Created by Utsav  on 26/08/24.
//

import Foundation
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Double
    let protein: Double
    let carbs: Double
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}
struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Test Appetizer", description: "This is a mock data", price: 9.9, imageURL: "", calories:90, protein: 50, carbs: 40)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer,sampleAppetizer,sampleAppetizer]
    static let orderItemOne = Appetizer(id: 001, name: "Test Appetizer One", description: "This is a mock data", price: 9.9, imageURL: "", calories:90, protein: 50, carbs: 40)
    static let orderItemTwo = Appetizer(id: 002, name: "Test Appetizer Two", description: "This is a mock data", price: 9.9, imageURL: "", calories:90, protein: 50, carbs: 40)
    static let orderItemThree = Appetizer(id: 003, name: "Test Appetizer Three", description: "This is a mock data", price: 9.9, imageURL: "", calories:90, protein: 50, carbs: 40)
    static let orderItem = [orderItemOne, orderItemTwo, orderItemThree]
}
