//
//  APIClient.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 08/11/2022.
//

import Foundation

// MARK: - HTTPMethod

/* GET, PUT, POST, DELETE */

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

final class APIClient<T: Codable> {
    static func fetch(with urlString: String, method: HTTPMethod , completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 20
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
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
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
                completion(.failure(APIError.requestFailed))
            }
            
        }
        task.resume()
    }
}



