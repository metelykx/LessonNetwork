//
//  NetworkManager.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import Foundation

final class NetworkManager {
    
    //MARK: - Propeties
    static let shared = NetworkManager()
    
    let urlNews = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=56f20e2c6d354ee58b9bfc763887716a"
    //MARK: - Initializer
    private init() {}
    
    //MARK: - Methods
    func getNews() async throws -> News{
        
        guard let url = URL(string: urlNews) else { throw NetworkError.ivalidURL}
    }
}


enum NetworkError: String, Error {
    case ivalidURL = "Invalid URL"
}
