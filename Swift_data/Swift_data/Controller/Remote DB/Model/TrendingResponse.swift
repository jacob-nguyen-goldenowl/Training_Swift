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
    let original_name: String?
    let original_title: String?
    let language: String
    let description: String
    let poster: String?
    let type: String
    let release_date: String?
    let vote_average: Double
    
    enum CodingKeys: String, CodingKey {
        case adult, id, original_name, original_title, release_date, vote_average
        case path = "backdrop_path"
        case language = "original_language"
        case description = "overview"
        case poster = "poster_path"
        case type = "media_type"
    }
    
}
