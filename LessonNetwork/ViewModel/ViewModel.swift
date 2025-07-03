//
//  ViewModel.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    //MARK: - Proporties
    @Published var topNews: [Article] = []
    
    init() {
        fetchTopNews()
    }
    
    //MARK: - Methods
    
    func fetchTopNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews(urlString: URLConstans.TopurlNews)
                topNews = articles.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
        
    }
}
