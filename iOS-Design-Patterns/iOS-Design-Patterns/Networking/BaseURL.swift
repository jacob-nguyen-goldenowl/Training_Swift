//
//  BaseURL.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation

struct BaseURL {
    static let APIKey = "f2e2decb81c4d31f78ee8b0b5778872f"
    static let weatherURL = "https://api.openweathermap.org"
}

extension BaseURL {
    static func getURLWith(lat: Double, lon: Double) -> String {
        return  "\(weatherURL)/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(APIKey)"
    }
}
