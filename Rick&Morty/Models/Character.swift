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

extension Character {
    static var mock: Character {
        Character(
            id: 1,
            name: "Rick Sanchez",
            status: .Alive,
            species: "Human",
            type: "",
            gender: .Male,
            origin: CharLocation(name: "Earth (C-137)", url: ""),
            location: CharLocation(name: "Earth (Replacement Dimension)", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: ["https://rickandmortyapi.com/api/episode/1"],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
}
