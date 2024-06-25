//
//  ApiError.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 25/06/2024.
//

import Foundation

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
