//
//  MangasDTO.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

struct MangaResultsDTO: Codable {
    let metadata: Metadata
    let items: [MangaDTO]
}

struct Metadata: Codable {
    let total, page, per: Int
}

struct MangaDTO: Codable {
    let id: Int
    let chapters: Int?
    let authors: [Author]
    let url: String
    let sypnosis: String?
    let titleEnglish: String?
    let score: Double
    let title: String
    let mainPicture: String
    let genres: [Genre]
    let themes: [Theme]
    let status: Status
    let demographics: [Demographic]
    let titleJapanese: String?
    let background: String?
    let startDate: Date?
    let endDate: Date?
    let volumes: Int?
    
    var toPresentation: Manga {
        Manga(id: id,
              chapters: chapters,
              authors: authors,
              url: url,
              sypnosis: sypnosis,
              titleEnglish: titleEnglish,
              score: score,
              title: title,
              mainPicture: mainPicture,
              genres: genres,
              themes: themes,
              status: status,
              demographics: demographics,
              titleJapanese: titleJapanese,
              background: background,
              startDate: startDate,
              endDate: endDate,
              volumes: volumes, 
              userCollection: false)
    }
}

