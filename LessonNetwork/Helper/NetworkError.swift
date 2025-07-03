//
//  NetworkError.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import Foundation

enum NetworkError: String, Error {
    case ivalidURL = "Invalid URL"
    case invalidResponse = "Invalid Response"
    case invalidData = "Invalid Data"
}
