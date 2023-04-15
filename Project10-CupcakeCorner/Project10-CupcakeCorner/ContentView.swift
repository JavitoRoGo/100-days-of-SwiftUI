//
//  ContentView.swift
//  Project10-CupcakeCorner
//
//  Created by Javier Rodríguez Gómez on 18/1/22.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var order = Order()
    @StateObject var model = OrderModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: /*$order.type*/$model.order.type) {
                        ForEach(MyOrder.types.indices) {
                            Text(MyOrder.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(model.order.quantity)", value: $model.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $model.order.specialRequestEnabled.animation())
                    if model.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $model.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $model.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(model: model)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
