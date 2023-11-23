//
//  GenreModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 15/11/23.
//

import Foundation

struct GenreResult: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
