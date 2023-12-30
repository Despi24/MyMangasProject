//
//  MangaGridCellView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangaGridCellView: View {
    let manga: Manga
    
    var body: some View {
        VStack {
            MangaPosterView(manga: manga)
                .overlay(alignment: .bottomTrailing) {
                    MangaRankView(manga: manga)
                }
            Text(manga.title)
                .bold()
        }
        .frame(maxWidth: 400)
    }
}

#Preview {
    MangaGridCellView(manga: .testManga)
}
