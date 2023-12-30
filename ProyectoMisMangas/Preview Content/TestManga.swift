//
//  TestManga.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

extension Manga {
    static let testManga = Manga(id: 1, chapters: nil, authors: [], url: "\"https://myanimelist.net/manga/111358/Shinozaki-kun_no_Maintenance_Jijou\"", sypnosis: "", titleEnglish: "Despi", score: 8.5, title: "Despi", mainPicture: "\"https://cdn.myanimelist.net/images/manga/1/210790l.jpg\"", genres: [], themes: [], status: .finished, demographics: [], titleJapanese: "", background: "", startDate: Date.now, endDate: nil, volumes: 11, userCollection: true)
}

struct TestMangaInteractor: MangaInteractorProtocol {
    func getMangas(page: Int) async throws -> [Manga] {
        guard let urlLocal = Bundle.main.url(forResource: "TestMangas", withExtension: "json") else { return [] }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
        
        let data = try Data(contentsOf: urlLocal)
        return try decoder.decode(MangaResultsDTO.self, from: data).items.map(\.toPresentation)
    }
    
    func searchManga(page: Int, contains: String) async throws -> [Manga] {
        guard let urlLocal = Bundle.main.url(forResource: "TestMangas", withExtension: "json") else { return [] }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
        
        let data = try Data(contentsOf: urlLocal)
        return try decoder.decode(MangaResultsDTO.self, from: data).items.map(\.toPresentation)
    }
    
    func searchMangaByName(page: Int, contains: String) async throws -> [Manga] {
        guard let urlLocal = Bundle.main.url(forResource: "TestMangas", withExtension: "json") else { return [] }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
        
        let data = try Data(contentsOf: urlLocal)
        return try decoder.decode(MangaResultsDTO.self, from: data).items.map(\.toPresentation)
    }
}

extension MangasVM {
    static let testVM = MangasVM(mangaInteractor: TestMangaInteractor())
}

struct TestMangaDetailInteractor: MangaDetailInteractorProtocol {
    func getAuthors(id: Int) async throws -> [Author] {
        try await getJSON(request: .get(url: .getAuthors(id: id)), type: [Author].self)
    }
    
    func getGenres(id: Int) async throws -> [Genre] {
        try await getJSON(request: .get(url: .getGenres), type: [Genre].self)
    }
    
    func getThemes(id: Int) async throws -> [Theme] {
        try await getJSON(request: .get(url: .getThemes), type: [Theme].self)
    }
    
    func getDemographics(id: Int) async throws -> [Demographic] {
        try await getJSON(request: .get(url: .getDemographics), type: [Demographic].self)
    }
}

extension MangaDetailVM {
    static let testDetailVM = MangaDetailVM(mangaDetailInteractor: TestMangaDetailInteractor(), selectedManga: .testManga)
}
