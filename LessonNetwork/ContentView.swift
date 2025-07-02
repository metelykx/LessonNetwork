//
//  ContentView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Proporties
    @State var news: [Article] = []
    
    
    //MARK: - Body
    var body: some View {
        VStack {
           
            ForEach(news, id: \.url) { article in
                Text(article.title)
            }
        }
        .onAppear {
            Task {
                await fetchNews()
            }
        }
    }
    
    //MARK: - Methods
    func fetchNews() async {
        do {
            let articles = try await NetworkManager.shared.getNews()
            news = articles.articles
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
