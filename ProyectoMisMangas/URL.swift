//
//  URL.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

let mainURL = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com")!

extension URL {
    static let getAllMangas = mainURL.appending(path: "list/mangas")
    static let getBestMangas = mainURL.appending(path: "list/bestMangas")
    static func getAuthors(id: Int) -> URL {
        mainURL.appending(path: "list/authors")
    }
    static let getDemographics = mainURL.appending(path: "list/demographics")
    static let getGenres = mainURL.appending(path: "list/genres")
    static let getThemes = mainURL.appending(path: "list/themes")
    
    static let mangasContainsURL = mainURL.appending(path: "search/mangasContains")
}
