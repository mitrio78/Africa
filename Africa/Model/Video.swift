//
//  Video.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}
