//
//  MainImageView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 03.07.2025.
//
import SwiftUI

struct MainImageView: View {
     
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
