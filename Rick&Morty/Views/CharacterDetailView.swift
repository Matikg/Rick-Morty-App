//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 21/06/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var character: Character
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                // MARK: Character Image
                AsyncImage(url: URL(string: character.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .padding()
                
                // MARK: Character Info
                Text("Status: \(character.status?.rawValue ?? "Unknown")")
                Text("Species: \(character.species ?? "Unknown")")
                Text("Gender: \(character.gender?.rawValue ?? "Unknown")")
                Text("Origin: \(character.origin?.name ?? "Unknown")")
                Text("Location: \(character.location?.name ?? "Unknown")")
                
            }
        }
        .navigationTitle(character.name ?? "")
    }
}

#Preview {
    CharacterDetailView(character: Character.mock)
}
