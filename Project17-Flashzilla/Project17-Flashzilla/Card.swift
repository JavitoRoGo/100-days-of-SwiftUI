//
//  Card.swift
//  Project17-Flashzilla
//
//  Created by Javier Rodríguez Gómez on 6/2/22.
//

import Foundation

struct Card: Codable, Identifiable {
    let id: UUID
    let prompt: String
    let answer: String
    
    static let example = Card(id: UUID(), prompt: "Who played de 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
