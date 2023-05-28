//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import Foundation

extension Bundle {
    func decode<Model: Decodable>(_ file: String) -> Model {
        // 1. Locate JSON-file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        // 2. Create property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        // 3. Create decoder
        let decoder = JSONDecoder()

        // 4. create property for decoded data
        guard let loaded = try? decoder.decode(Model.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        // 5. return ready-to-use data
        return loaded
    }
}
