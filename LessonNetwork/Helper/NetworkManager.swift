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

    //MARK: - Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: - Methods
    func getNews(urlString: String) async throws -> News{
        
        guard let url = URL(string: urlString) else { throw NetworkError.ivalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse}
        do {
            return try decoder.decode(News.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}



