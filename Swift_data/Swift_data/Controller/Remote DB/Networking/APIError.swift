//
//  APIError.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 08/11/2022.
//

import Foundation

enum APIError: Error {
    
    case invalidURL
    case requestFailed
    case networkFailed
    case decodingFailed
    case dataFailed
    
    public var localizedDescription: String {
        switch self {
            case .invalidURL:
                return "Uniform Resource Locator is invalid."
            case .requestFailed:
                return "400 Bad Request"
            case .networkFailed:
                return "Internet connection is not good."
            case .decodingFailed:
                return "Decoding failed."
            case .dataFailed:
                return "500 Internal Server Error."
        }
    }
    
}
