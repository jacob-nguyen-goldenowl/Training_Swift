//
//  API.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation

final class API<T: Codable> {
    
    static func fetch(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            guard 200 ... 299 ~= statusCode else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                print(result)
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
                completion(.failure(APIError.requestFailed))
            }
            
        }
        task.resume()
        
    }
}
