//
//  ApiService.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import Foundation

class ApiService {
    private let baseURL = "https://rickandmortyapi.com/api"
    
    func fetchCharacters() async throws -> CharacterResponse {
        do {
            guard let url = URL(string: "\(baseURL)/character") else { throw ApiError.invalidURL }
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

enum ApiError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid"
        case .serverError:
            return "There was an error with the server"
        case .invalidData:
            return "The data is invalid"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
