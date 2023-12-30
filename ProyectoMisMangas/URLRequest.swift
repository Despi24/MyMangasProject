//
//  URLRequest.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import Foundation

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 30
        request.httpMethod = "GET"
        return request
    }
    
    static func getPages(url: URL, page: Int, per: Int = 10, contains: String? = nil) -> URLRequest {
        let page = URLQueryItem(name: "page", value: String(page))
        let per = URLQueryItem(name: "per", value: String(per))
        var request = URLRequest(url: url.appending(path: contains ?? ""))
        request.url?.append(queryItems: [page, per])
        request.timeoutInterval = 30
        request.httpMethod = "GET"
        return request
    }
    
    static func searchMangaByName(url: URL, contains: String, page: Int) -> URLRequest {
        var request = URLRequest(url: url.appending(path: contains))
        let page = URLQueryItem(name: "page", value: String(page))
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        return request
    }
}
