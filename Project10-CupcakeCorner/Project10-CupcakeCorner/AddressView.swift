//
//  AddressView.swift
//  Project10-CupcakeCorner
//
//  Created by Javier Rodríguez Gómez on 19/1/22.
//

import SwiftUI

struct AddressView: View {
//    @ObservedObject var order: Order
    @ObservedObject var model: OrderModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $model.order.name)
                TextField("Street Address", text: $model.order.streetAddress)
                TextField("City", text: $model.order.city)
                TextField("Zip", text: $model.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(model: model)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(model.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(model: OrderModel())
    }
}
