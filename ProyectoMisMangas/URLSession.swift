//
//  URLSession.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

extension URLSession {
    func getData(for url: URLRequest) async throws -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(for: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.noHTTP }
            return (data, response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }
}
