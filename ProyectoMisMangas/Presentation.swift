//
//  Presentation.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation
import SwiftUI

struct Manga: Identifiable, Hashable {
    let id: Int
    let chapters: Int?
    let authors: [Author]
    let url: String?
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
    var userCollection: Bool
    
    var posterURL: URL? {
            let poster = mainPicture.replacingOccurrences(of: "\"", with: "")
            return URL(string: poster)
    }
    
    var chaptersString: String {
        if let chapters = chapters {
            "\(chapters) chapters"
        } else {
            "No chapters available"
        }
    }
    
    var volumesString: String {
        if let volumes = volumes {
            "\(volumes) volumes"
        } else {
            "No volumes available"
        }
    }
    
    var formattedScore: String {
        score.formatted(.number.precision(.fractionLength(1)))
    }
    
    var formattedStartDate: String {
        if let firstDate = startDate {
            return firstDate.formatted(date: .abbreviated, time: .omitted)
        }
        return "Unknown"
    }
    
    var formattedEndDate: String {
        if let finalDate = endDate {
            return finalDate.formatted(date: .abbreviated, time: .omitted)
        }
        return "Unknown or still publishing"
    }
    
    var scoreColor: Color {
        switch score {
        case ..<5:
            return .red
        case 5..<7.5:
            return .orange
        case 7.5..<10:
            return .green
        default:
            return .black
        }
    }
}
