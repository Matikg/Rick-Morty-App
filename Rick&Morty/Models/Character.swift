//
//  Character.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import Foundation

struct Character: Decodable, Identifiable {
    var id: Int
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Location?
    var location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

struct CharacterResponse: Decodable {
    var info: CharacterInfo?
    var results: [Character]?
}

struct CharacterInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
