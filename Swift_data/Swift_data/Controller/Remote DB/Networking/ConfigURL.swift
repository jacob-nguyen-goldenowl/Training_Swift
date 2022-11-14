//
//  ConfigURL.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 08/11/2022.
//

import Foundation

struct BaseURL {
    static let APIKey = "18755701c4813f2269962a2a97bbffa8"
    static let movieURL = "https://api.themoviedb.org"
}

extension BaseURL {
    static func getURLWith() -> String {
        return  "\(movieURL)/3/trending/all/day?api_key=\(APIKey)"
    }
}

