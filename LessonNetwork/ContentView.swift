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
   
}

#Preview {
    ContentView()
}
