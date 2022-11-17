//
//  ImageCache.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 16/11/2022.
//

import UIKit

final class ImageCache {
    static let shared = ImageCache()
    
    private init() {}
    
    private let imageCache = NSCache<NSNumber, UIImage>()
    private let initiatedQueue = DispatchQueue.global(qos: .userInitiated)
    
    func fetchImage(atIndex index: Int,
                    urlString: String,
                    completion: @escaping (UIImage?, Int) -> Void) 
    {
        let imageKey = NSNumber(value: index)
        
        if let cahed = self.imageCache.object(forKey: imageKey) {
            completion(cahed, index)
            return
        }   
        
        loadImage(withURL: urlString) { [weak self] (image) in
            guard let self = self, let image = image else {
                completion(nil, index)
                return
            }
            self.imageCache.setObject(image, forKey: imageKey)
            completion(image, index)
            
        }
    }
    
    private func loadImage(withURL urlString: String, completion: @escaping (UIImage?) -> ()) {
        initiatedQueue.async {
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                completion(image)
            }
        }
    }
    
}
