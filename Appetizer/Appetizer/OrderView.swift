import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @State private var showingOrderAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button(action: {
                        showingOrderAlert = true
                    }) {
                        APButton(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                    .disabled(order.items.isEmpty)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer.")
                }
            }
            .navigationTitle("🧾 Order")
            .alert(isPresented: $showingOrderAlert) {
                Alert(
                    title: Text("Order Placed"),
                    message: Text("Your order of \(order.totalPrice, specifier: "%.2f") was successful. Bon Appétit!"),
                    dismissButton: .default(Text("OK")) {
                        order.clearOrder()  // Clear the order after the alert is dismissed
                    }
                )
            }
        }
    }
}

#Preview {
    OrderView()
}

// Extend the Order class with a method to clear the order
extension Order {
    func clearOrder() {
        items.removeAll()
    }
}
