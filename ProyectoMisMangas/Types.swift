//
//  Author.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

struct Author: Codable, Hashable, Identifiable {
    let id: UUID
    let firstName, lastName: String
    let role: Role
    
    enum Role: String, Codable {
        case art = "Art"
        case story = "Story"
        case storyArt = "Story & Art"
    }
}

struct Demographic: Codable, Hashable {
    let id, demographic: String
}

struct Genre: Codable, Hashable {
    let id, genre: String
}

enum Status: String, Codable {
    case currentlyPublishing = "currently_publishing"
    case finished = "finished"
    case onHiatus = "on_hiatus"
    case discontinued = "discontinued"
}

struct Theme: Codable, Hashable {
    let id, theme: String
}
