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
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    phase.image!
                    .resizable()
                    .offset(y: -reader.frame(in: .global).minY)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: SizeConstant.screenWidth, height: reader.frame(in: .global).minY + SizeConstant.avatarHeight + 10)
                }
            }
        }.frame(height: UIScreen.main.bounds.width)
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

struct SizeConstant {
    static var avatarHeight: CGFloat {
        UIScreen.main.bounds.height / 2
    }
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

