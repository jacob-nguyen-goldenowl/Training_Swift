//
//  TrendingMovie.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 08/11/2022.
//

import Foundation

struct TrendingResponse: Codable {
    let page: Int
    let results: [Movie]
}

struct Movie: Codable {
    let adult: Bool
    let path: String?
    let id: Int
    let originalName: String?
    let originalTitle: String?
    let language: String
    let description: String
    let poster: String?
    let type: String
    let releaseDate: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case adult, id
        case path = "backdrop_path"
        case language = "original_language"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case description = "overview"
        case poster = "poster_path"
        case type = "media_type"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
}
