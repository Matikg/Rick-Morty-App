//
//  TabView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 22/06/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            
            CharacterListView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Characters")
                    }
                }
            
            LocationListView()
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("Locations")
                    }
                }
            
            EpisodeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Episodes")
                    }
                }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(CharacterModel())
        .environmentObject(LocationModel())
}
