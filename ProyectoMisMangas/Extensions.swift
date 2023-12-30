//
//  Extensions.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

extension DateFormatter {
    static let dateFormatCustom = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return date
    }()
}
