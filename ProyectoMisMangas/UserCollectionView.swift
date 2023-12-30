//
//  UserCollectionView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct UserCollectionView: View {
    @EnvironmentObject var vm: MangasVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
                    ForEach(vm.collectedManga) { manga in
                        NavigationLink(value: manga) {
                            MangaGridCellView(manga: manga)
                        }
                    }
                })
            }
            .navigationDestination(for: Manga.self) { manga in
                MangaDetailView(selectedManga: manga)
            }
            .navigationTitle("My Collection")
        }
    }
}

#Preview {
    UserCollectionView()
        .environmentObject(MangasVM.testVM)
}
