//
//  Model.swift
//  Milestone16-18
//
//  Created by Javier Rodríguez Gómez on 9/2/22.
//

import Foundation

struct Rolled: Codable, Identifiable {
    let id: UUID
    let dice: String
    let roll: Int
    
    static let example = Rolled(id: UUID(), dice: "1D4-3D6-1D8", roll: 34)
}

class RolledModel: ObservableObject {
    @Published var totalRolled: [Rolled] = [Rolled.example]
    
    func load() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = path.appendingPathComponent("Results").appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileURL)
            totalRolled = try JSONDecoder().decode([Rolled].self, from: data)
        } catch {
            // error
        }
    }
    
    func save() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = path.appendingPathComponent("Results").appendingPathExtension("json")
        do {
            let data = try JSONEncoder().encode(totalRolled)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
        } catch {
            // error
        }
    }
}
