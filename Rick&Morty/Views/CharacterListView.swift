//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 19/06/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @EnvironmentObject var model: CharacterModel
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack(alignment: .leading) {
                    
                    ForEach(model.characters) { character in
                        
                        NavigationLink {
                            CharacterDetailView(character: character)
                                
                        } label: {
                            CharacterRowView(character: character)
                                .task {
                                    if character.id == model.characters.last?.id {
                                        await model.getCharacters()
                                    }
                                }
                        }
                        
                        Divider()
                    }
                }
                .padding()
                .foregroundStyle(.primary)
            }
            .navigationTitle("Characters")
            .refreshable {
                await model.handleRefresh()
            }
        }
        .task {
            await model.getCharacters()
        }
    }
}

#Preview {
    CharacterListView()
        .environmentObject(CharacterModel())
}
