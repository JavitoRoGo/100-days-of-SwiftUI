//
//  FileManager-DocumentsDirectory.swift
//  Project14-BucketList
//
//  Created by Javier Rodríguez Gómez on 30/1/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
