//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(model.characters) { character in
                        CharacterRowView(character: character)
                    }
                }
                .padding()
            }
            .navigationTitle("Characters")
        }
        .task {
            await model.getCharacters()
        }
    }
}

#Preview {
    CharacterListView()
        .environmentObject(ContentModel())
}
