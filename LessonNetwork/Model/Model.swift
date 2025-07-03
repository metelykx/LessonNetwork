//
//  Model.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//
import Foundation
// MARK: - Welcome
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date

}

