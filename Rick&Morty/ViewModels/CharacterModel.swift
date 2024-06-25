//
//  ContentModel.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 20/06/2024.
//

import Foundation

@MainActor
class CharacterModel: ObservableObject {
    
    @Published var characters = [Character]()
    
    func getCharacters() async {
        do {
            let characterResponse = try await ApiService.shared.fetchCharacters()
            self.characters.append(contentsOf: characterResponse.results)
        }
        catch {
            print(error)
        }
    }
    
    func handleRefresh() async {
        do {
            self.characters.removeAll()
            ApiService.shared.page = 0
            self.characters = try await ApiService.shared.fetchCharacters().results
        }
        catch {
            print(error)
        }
    }
}
