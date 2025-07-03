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
    private let decoder = JSONDecoder()
    private let TopurlNews = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=56f20e2c6d354ee58b9bfc763887716a"
    private let bottomURLNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=56f20e2c6d354ee58b9bfc763887716a"
    //MARK: - Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: - Methods
    func getNews() async throws -> News{
        
        guard let url = URL(string: TopurlNews) else { throw NetworkError.ivalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse}
        do {
            return try decoder.decode(News.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}



