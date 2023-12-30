//
//  MangaInteractor.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

protocol MangaInteractorProtocol {
    func getMangas(page: Int) async throws -> [Manga]
    func searchManga(page: Int, contains: String) async throws -> [Manga]
}

struct MangaInteractor: MangaInteractorProtocol {
    func getMangas(page: Int) async throws -> [Manga] {
        try await getJSON(request: .getPages(url: .getAllMangas, page: page), type: MangaResultsDTO.self).items.map(\.toPresentation)
    }
    
    func searchManga(page: Int, contains: String) async throws -> [Manga] {
        try await getJSON(request: .getPages(url: .mangasContainsURL, page: page, contains: contains), type: MangaResultsDTO.self).items.map(\.toPresentation)
    }
}

