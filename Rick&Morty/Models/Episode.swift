//
//  Episode.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import Foundation

struct Episode: Decodable, Identifiable {
    var id: Int
    var name: String?
    var airDate: String?
    var episode: String
    var characters: [String]?
    var url: String?
    var created: String?
}

struct EpisodeResponse: Decodable {
    var info: EpisodeInfo?
    var results = [Episode]()
}

struct EpisodeInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
