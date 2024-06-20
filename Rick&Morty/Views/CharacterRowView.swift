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
                Text(character.name ?? "")
                    .bold()
                HStack {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 10, height: 10)
                    Text(character.status?.rawValue.capitalized ?? "")
                }
            }
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    CharacterRowView()
//}
