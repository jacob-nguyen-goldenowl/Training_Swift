//
//  WeatherResponse.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation

// MARK: - Weather response
struct WeatherResponse: Codable {
    let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let name: String
    let cod: Int
}

// MARK: - Main response
struct Main: Codable {
    let temp: Double
    let humidity: Int
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - weather
struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
}

// MARK: - Wind response
struct Wind: Codable {
    let speed: Double
    let deg: Double?
}

// MARK: - Clouds response
struct Clouds: Codable {
    let all: Int
}

// MARK: - Sys response
struct Sys: Codable {
    let type: Int?
    let country: String
    let sunrise: Int
    let sunset: Int
}

