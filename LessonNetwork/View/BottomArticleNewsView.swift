//
//  BottomArticleNewsView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 03.07.2025.
//

import SwiftUI


struct BottomArticleNewsView: View {
    
    let article: Article
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()  // Fixed typo here
                            .frame(width:120,height: 120)
                            .cornerRadius(10)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 120)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .cornerRadius(10)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()  // Fixed typo here
                                .frame(height: 50)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                
                Spacer()
                
                Text(article.publishedAt.convertData())
                    .descriptionFont()  // Added parentheses here
            }
            
        }
        .frame(width:120, height: 240)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}

