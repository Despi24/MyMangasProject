//
//  MangasVM.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

final class MangasVM: ObservableObject {
    let mangaInteractor: MangaInteractorProtocol
    
    @Published var mangas: [Manga] = []
    @Published var algo = false
    
    @Published var showAlert = false
    @Published var msg = ""
    @Published var searchText = "" {
        didSet {
            mangas.removeAll()
            page = 1
        }
    }
    
    var page = 1
    
    var collectedManga: [Manga] {
        mangas.filter { $0.userCollection }
    }
    
    init(mangaInteractor: MangaInteractorProtocol = MangaInteractor()) {
        self.mangaInteractor = mangaInteractor
        
        Task { await getMangas() }
    }
    
    func getMangas() async {
        if searchText.isEmpty {
            do {
                let mang = try await mangaInteractor.getMangas(page: page)
                await MainActor.run {
                    mangas += mang
                }
            } catch let error as NetworkError {
                print(error)
                await MainActor.run {
                    msg = "\(error)"
                    showAlert.toggle()
                }
            } catch {
                print(error)
                await MainActor.run {
                    msg = "\(error)"
                    showAlert.toggle()
                }
            }
        } else {
            showAlert.toggle()
        }
    }
    
    func searchManga() async {
        if !searchText.isEmpty {
            do {
                if page == 1 {
                    await MainActor.run {
                        mangas.removeAll()
                    }
                }
                let srch = try await mangaInteractor.searchManga(page: page, contains: searchText)
                await MainActor.run {
                    mangas += srch
                }
            } catch {
                print(error)
            }
        } else {
            await MainActor.run {
                mangas.removeAll()
                page = 1
            }
            await getMangas()
        }
    }
    
    func toggleCollection(manga: Manga) {
        if let index = mangas.firstIndex(where: { $0.id == manga.id }) {
            mangas[index].userCollection.toggle()
        }
    }
    
    func loadNextPage(manga: Manga) {
        if isLastItem(manga: manga) {
            page += 1
            print("Cargo siguiente página")
            Task { 
                searchText.isEmpty ? await getMangas() : await searchManga()
            }
        }
    }
    
    func isLastItem(manga: Manga) -> Bool {
        mangas.last?.id == manga.id
    }
    
}
