//
//  MangaDetailVM.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 25/12/23.
//

import Foundation

final class MangaDetailVM: ObservableObject {
    let mangaDetailInteractor: MangaDetailInteractorProtocol
    let selectedManga: Manga
    
    @Published var author: [Author] = []
    @Published var genre: [Genre] = []
    @Published var theme: [Theme] = []
    @Published var demographics: [Demographic] = []
    
    init(mangaDetailInteractor: MangaDetailInteractorProtocol = MangaDetailInteractor(), selectedManga: Manga) {
        self.mangaDetailInteractor = mangaDetailInteractor
        self.selectedManga = selectedManga
        
        
    }
    
    func getAuthors(id: Int) async {
        do {
            let auth = try await mangaDetailInteractor.getAuthors(id: selectedManga.id)
            await MainActor.run {
                author = auth
            }
        } catch {
            print(error)
        }
    }
    
    func getGenres(id: Int) async {
        do {
            let gen = try await mangaDetailInteractor.getGenres(id: selectedManga.id)
            await MainActor.run {
                genre = gen
            }
        } catch {
            print(error)
        }
    }
    
    func getThemes(id: Int) async {
        do {
            let thm = try await mangaDetailInteractor.getThemes(id: selectedManga.id)
            await MainActor.run {
                theme = thm
            }
        } catch {
            print(error)
        }
    }
    
    func getDemographics(id: Int) async {
        do {
            let dem = try await mangaDetailInteractor.getDemographics(id: selectedManga.id)
            await MainActor.run {
                demographics = dem
            }
        } catch {
            print(error)
        }
    }
}
