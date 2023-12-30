//
//  MangaPosterView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangaPosterView: View {
    let manga: Manga
    
    var body: some View {
        AsyncImage(url: manga.posterURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    MangaPosterView(manga: .testManga)
}
