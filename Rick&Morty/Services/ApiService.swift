//
//  ApiService.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import Foundation

class ApiService {
    private let baseURL = "https://rickandmortyapi.com/api"
    var page = 0
    
    func fetchCharacters() async throws -> CharacterResponse {
        do {
            if page < 42 {
                page += 1
            }
            guard let url = URL(string: "\(baseURL)/character/?page=\(page)") else { throw ApiError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.serverError }
            let decoder = JSONDecoder()
            guard let characterResponse = try? decoder.decode(CharacterResponse.self, from: data) else { throw ApiError.invalidData }
            return characterResponse
        }
        catch {
            throw error
        }
    }
}


