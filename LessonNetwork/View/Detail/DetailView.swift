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
        ScrollView(.vertical, showsIndicators: false) {
            MainImageView(article: article)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(article.title)
                    .titleFont()
                
                Text(article.description!)
                    .descriptionFont()
                
                Text(article.publishedAt.convertData())
                    .descriptionFont()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background)
            .background(GradientAvatarView())
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct GradientAvatarView: View {
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstant.avatarHeight / 4)
            .offset(y: -SizeConstant.avatarHeight / 4)
        }
    }
}



#Preview {
    DetailView(
        article: Article(
            title: "Example",
            description: "fpefpepfepfpefpef",
            url: "",
            urlToImage:  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imgonline.com.ua%2Fmonochrome-picture.php&psig=AOvVaw0w_BjjOln3S2quH8ohoeQl&ust=1751623626047000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiDo9K4oI4DFQAAAAAdAAAAABAE",
            publishedAt: Date()
        )
    )
}





