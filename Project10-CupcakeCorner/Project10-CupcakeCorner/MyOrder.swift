//
//  MyOrder.swift
//  Project10-CupcakeCorner
//
//  Created by Javier Rodríguez Gómez on 21/1/22.
//

import Foundation

struct MyOrder: Codable, Identifiable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var id = UUID()
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || streetAddress == " " || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
}

final class OrderModel: ObservableObject {
    @Published var order = MyOrder()
}
