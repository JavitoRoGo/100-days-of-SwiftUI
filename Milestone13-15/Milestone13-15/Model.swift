//
//  Model.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 1/2/22.
//

import CoreLocation
import Foundation
import SwiftUI
import MapKit

struct MyThing: Codable, Identifiable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = MyThing(id: UUID(), name: "Example name", latitude: 50, longitude: 50)
}


final class MyThingModel: ObservableObject {
    @Published var myThings: [MyThing] {
        didSet {
            saveToJson()
        }
    }
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 50), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    let fileURL = getDocumentsDirectory().appendingPathComponent("MYTHINGS").appendingPathExtension("json")
    
    init() {
        do {
            let jsonData = try Data(contentsOf: fileURL)
            myThings = try JSONDecoder().decode([MyThing].self, from: jsonData)
            print("Data loaded.")
        } catch {
            myThings = []
            print("Unable to load data.")
        }
    }
    
    func saveToJson() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(myThings)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print("Data saved!")
        } catch {
            print("Error saving data.")
        }
    }
    
    func image(_ name: String) -> Image {
        var image = Image(systemName: "questionmark.app")
        let documents = getDocumentsDirectory()
        let fileURL = documents.appendingPathComponent(name).appendingPathExtension("jpg")
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                let imageData = try Data(contentsOf: fileURL)
                if let uiimage = UIImage(data: imageData) {
                    image = Image(uiImage: uiimage)
                }
            } catch {
                print("No image found in disk.")
            }
        }
        return image
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
