//
//  MangaCellView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangaCellView: View {
    let manga: Manga
    
    var body: some View {
        HStack {
            MangaPosterView(manga: manga)
                .overlay(alignment: .bottomTrailing) {
                    MangaRankView(manga: manga)
                }
            VStack(alignment: .leading) {
                Text(manga.title)
                    .bold()
                Text(manga.chaptersString)
                ForEach(manga.authors) { author in
                    Text(author.lastName)
                }
            }
        }
    }
}

#Preview {
    MangaCellView(manga: .testManga)
}
