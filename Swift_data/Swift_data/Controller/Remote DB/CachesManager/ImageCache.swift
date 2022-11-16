//
//  ImageCache.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 16/11/2022.
//

import UIKit

final class ImageCache {
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    private let initiatedQueue = DispatchQueue.global(qos: .userInitiated)
    
    private(set) var imageKeys: [NSString]
    
    init() {
        imageKeys = []
        for i in 1...40 {
            imageKeys.append(NSString(string: "image\(i)"))
        }
    }
    
    func fetchImage(atIndex index: Int,
                    urlString: String,
                    completion: @escaping (UIImage?, Int) -> Void) 
    {
        
        let imageKey = imageKeys[index]
        print(imageKey)
        
        if let cahed = self.imageCache.object(forKey: "\(imageKey)" as NSString) {
            print("Using a cached image for item: \(imageKey)")
            completion(cahed, index)
            return
        }   
        
        initiatedQueue.async { 
            
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            print("why is running ...")
            DispatchQueue.main.async {
                
                if let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: imageKey)
                    completion(image, index)
                    
                }
                
            }
            
        }
    }
        
        
        
//        loadImage(withURL: urlString) { [weak self] (image) in
//                
//            guard let self = self, let image = image else {
//                completion(nil, index)
//                return
//            }
//            
//            
//                
//            print("get key\(imageKey)")
//            print("index of key\(index)")
//                
//                self.imageCache.setObject(image, forKey: imageKey)
//                completion(image, index)
//        }
            
    
//    private func loadImage(withURL urlString: String, completion: @escaping (UIImage?) -> ()) {
//        
//        userInitiatedQueue.async {
//            guard let url = URL(string: urlString) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                let image = UIImage(data: data)
//                completion(image)
//            }
//        }
//        
//    }
    
}
