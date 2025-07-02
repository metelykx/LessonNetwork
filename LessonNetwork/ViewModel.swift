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
        fetchNews()
    }
    
    //MARK: - Methods
    
    func fetchNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews()
                topNews = articles.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
        
    }
}
