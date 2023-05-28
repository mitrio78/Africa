//
//  FileName.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import Foundation

enum FileType: String {
    case animals
    case covers
    case locations
    case videos

    var filename: String {
        switch self {
        case .animals:
            return "animals.json"

        case .covers:
            return "covers.json"

        case .locations:
            return "locations.json"

        case .videos:
            return "videos.json"
        }
    }
}
