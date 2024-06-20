//
//  ContentModel.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 20/06/2024.
//

import Foundation

@MainActor
class ContentModel: ObservableObject {
    
    private var service = ApiService()
    @Published var characters = [Character]()
    
    func getCharacters() async {
        do {
            self.characters = try await service.fetchCharacters().results
        }
        catch {
            print(error)
        }
    }
}
