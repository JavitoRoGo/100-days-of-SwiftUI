//
//  Prospect.swift
//  Project16-HotProspects
//
//  Created by Javier Rodríguez Gómez on 3/2/22.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    let saveKey = "SavedData"
    
//    init() {
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
//        people = []
//    }
    
    init() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey).appendingPathExtension("json")
        do {
            let jsonData = try Data(contentsOf: fileURL)
            people = try JSONDecoder().decode([Prospect].self, from: jsonData)
            print("Data decoded from json")
        } catch {
            people = []
            print("Error decoding from json")
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
//    private func save() {
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
//    }
    
    private func save() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey).appendingPathExtension("json")
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(people)
            try jsonData.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print("Data saved to json")
        } catch {
            print("Error saving to json")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
