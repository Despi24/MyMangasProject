//
//  MangaPosterDetailView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangaPosterDetailView: View {
    let manga: Manga
    
    var body: some View {
        AsyncImage(url: manga.posterURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        } placeholder: {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
}

#Preview {
    MangaPosterDetailView(manga: .testManga)
}
