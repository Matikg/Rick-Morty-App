//
//  CharacterRowView.swift
//  Rick&Morty
//
//  Created by Mateusz Grudzień on 20/06/2024.
//

import SwiftUI

struct CharacterRowView: View {
    
    var character: Character
    var statusColor: Color {
        switch character.status {
        case .Alive:
            return .green
        case .Dead:
            return .red
        case .unknown:
            return .yellow
        case .none:
            return .gray
        }
    }
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(String(character.id))
                Text(character.name ?? "")
                    .bold()
                    .font(.title2)
                
                HStack {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 10, height: 10)
                    Text("\(character.status?.rawValue.capitalized ?? "") - \(character.species ?? "")")
                        .font(.title3)
                }
            }
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    CharacterRowView()
//}
