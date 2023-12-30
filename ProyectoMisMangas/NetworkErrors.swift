//
//  NetworkErrors.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case noHTTP
    case status(Int)
    case general(Error)
    case json(Error)
    case invalidURL(Error)
    
    var description: String{
        switch self {
        case .noHTTP:
            "No es una llamada HTTP"
        case .status(let int):
            "El statuscode es: \(int)"
        case .general(let error):
            "Error general: \(error)"
        case .json(let error):
            "Fallo en el parseo: \(error)"
        case .invalidURL(let error):
            "La URL no es válida: \(error)"
        }
    }
}
