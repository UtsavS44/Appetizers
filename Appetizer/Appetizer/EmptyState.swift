//
//  EmptyState.swift
//  Appetizer
//
//  Created by Utsav  on 30/08/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y:-20)
        }
    }
}

#Preview {
    EmptyState(imageName: "emptyh-order", message: "Empty like you stomach")
}
