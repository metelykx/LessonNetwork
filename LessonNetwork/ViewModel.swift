//
//  ViewModel.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import Foundation

final class ViewModel: ObservableObject {
    
    //MARK: - Proporties
    @Published var topNews: [Article] = []
    
    //MARK: - Methods
    
    func fetchNews() async {
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
