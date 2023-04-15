//
//  ImageSaver.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 2/2/22.
//

import UIKit

class ImageSaver: NSObject {
    func writeToDisk(image: UIImage, name: String) {
        let documents = getDocumentsDirectory()
        let fileURL = documents.appendingPathComponent(name).appendingPathExtension("jpg")
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print("Image saved to disk.")
        }
    }
}
