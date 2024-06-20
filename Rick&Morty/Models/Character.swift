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
    var status: CharacterStatus?
    var species: String?
    var type: String?
    var gender: CharacterGender?
    var origin: CharLocation?
    var location: CharLocation?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

struct CharacterResponse: Decodable {
    var info: CharacterInfo?
    var results = [Character]()
}

struct CharacterInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
struct CharLocation: Decodable {
    var name: String?
    var url: String?
}

enum CharacterStatus: String, Decodable {
    case Alive
    case Dead
    case unknown
}

enum CharacterGender: String, Decodable {
    case Female
    case Male
    case Genderless
    case unknown
}
