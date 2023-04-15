//
//  CheckoutView.swift
//  Project10-CupcakeCorner
//
//  Created by Javier Rodríguez Gómez on 19/1/22.
//

import SwiftUI

struct CheckoutView: View {
//    @ObservedObject var order: Order
    @ObservedObject var model: OrderModel
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingError = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                .accessibilityHidden(true)
                
                Text("Your total is \(model.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Ups! An error has occured.", isPresented: $showingError) {
            // se crea un botón OK por defecto
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(model.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(MyOrder.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(MyOrder.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed")
            showingError = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(model: OrderModel())
    }
}
