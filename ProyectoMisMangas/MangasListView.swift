//
//  ContentView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import SwiftUI

struct MangasListView: View {
    @EnvironmentObject var vm: MangasVM
    @State var timer: Timer?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.mangas) { manga in
                    NavigationLink(value: manga) {
                        MangaCellView(manga: manga)
                            .onAppear(perform: {
                                vm.loadNextPage(manga: manga)
                            })
                    }
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search mangas")
            .onChange(of: vm.searchText) { _, _ in
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                    Task {
                        await vm.searchManga()
                    }
                }
            }
            .navigationDestination(for: Manga.self) { manga in
                MangaDetailView(selectedManga: manga)
            }
            .navigationTitle("All Mangas")
            .navigationBarTitleDisplayMode(.automatic)
            .alert("Something went wrong", isPresented: $vm.showAlert) {
                Button(action: {
                    Task { await vm.getMangas() }
                }, label: {
                    Text("Try again")
                })
            } message: {
                Text(vm.msg)
            }
        }
    }
}
#Preview {
    MangasListView()
        .environmentObject(MangasVM.testVM)
}
