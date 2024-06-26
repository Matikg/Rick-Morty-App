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
    private var page = 0
    private var totalPages = 0
    @Published var showError = false
    @Published var errorMessage: String?
    
    func getCharacters() async {
        do {
            guard page < totalPages || page == 0 else { return }
            page += 1
            let characterResponse = try await ApiService.shared.fetchCharacters(page: page)
            self.totalPages = characterResponse.info?.pages ?? 0
            self.characters.append(contentsOf: characterResponse.results)
        }
        catch(let error) {
            print(error)
            self.showError = true
            self.errorMessage = error.localizedDescription
        }
    }
    
    func handleRefresh() async {
        self.characters.removeAll()
        self.page = 0
        self.totalPages = 0
        await getCharacters()
    }
}
