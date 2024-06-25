//
//  LocationListView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 22/06/2024.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject var model: LocationModel
    
    var body: some View {
        List(model.locations) { location in
            Text(location.name ?? "")
        }
        .task {
            await model.getLocations()
        }
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationModel())
}
