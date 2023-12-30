//
//  MangaDetailInteractor.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 25/12/23.
//

import Foundation

protocol MangaDetailInteractorProtocol {
    func getAuthors(id: Int) async throws -> [Author]
    func getGenres(id: Int) async throws -> [Genre]
    func getThemes(id: Int) async throws -> [Theme]
    func getDemographics(id: Int) async throws -> [Demographic]
}

struct MangaDetailInteractor: MangaDetailInteractorProtocol {
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
