//
//  LocationModel.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 25/06/2024.
//

import Foundation

@MainActor
class LocationModel: ObservableObject {
    
    @Published var locations = [Location]()
    
    func getLocations() async {
        do {
            let locationResponse = try await ApiService.shared.fetchLocations()
            self.locations.append(contentsOf: locationResponse.results)
        }
        catch {
            print(error)
        }
    }
    
}
