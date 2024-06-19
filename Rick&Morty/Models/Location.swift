//
//  Location.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import Foundation

struct Location: Decodable, Identifiable {
    var id: Int
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
}

struct LocationResponse: Decodable {
    var info: LocationInfo?
    var results: [Location]?
}

struct LocationInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
