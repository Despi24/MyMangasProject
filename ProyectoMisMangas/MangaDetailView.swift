//
//  MangaDetailView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangaDetailView: View {
    @EnvironmentObject var vm: MangasVM
//    @ObservedObject var detailVM: MangaDetailVM
    let selectedManga: Manga
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ScrollView {
            VStack {
                MangaPosterDetailView(manga: selectedManga)
                Text(selectedManga.title)
                    .font(.largeTitle)
                HStack(alignment: .bottom) {
                    Text("First publication: \(selectedManga.formattedStartDate)")
                    MangaRankView(manga: selectedManga)
                }
                Spacer()
            }
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        vm.toggleCollection(manga: selectedManga)
                        dismiss()
                    }, label: {
                        Text(selectedManga.userCollection ? "Remove from Collection" : "Add to Collection")
                    })
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MangaDetailView(selectedManga: .testManga)
        .environmentObject(MangasVM.testVM)
}
