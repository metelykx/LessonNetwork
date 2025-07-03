//
//  DetailView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 03.07.2025.
//


import SwiftUI

struct DetailView: View {
    
    let article: Article
    
    var body: some View {
        GeometryReader { reader in
                
        }
    }
}

#Preview {
    DetailView(
        article: Article(
            title: "Example",
            description: "fpefpepfepfpefpef",
            url: "",
            urlToImage:  "https://picsum.photos/200",
            publishedAt: Date()
        )
    )
}



