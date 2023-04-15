//
//  Model.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 23/1/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let friends: [Friend]
    
    static let dataTest = User(id: "lj34jl234jl3k4j", isActive: true, name: "Usuario", age: 55, company: "Compañía", email: "email@email.mail", address: "c/ Falsa, 123", about: "Información sobre el ususario", registered: Date.now, friends: [Friend(id: "jajaja", name: "Amigo1"), Friend(id: "owieur", name: "Amigo2")])
}

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}
