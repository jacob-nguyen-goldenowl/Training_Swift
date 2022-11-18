//
//  FirestoreManager.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 15/11/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

struct MovieFirestore {
    let title: String
    let description: String
    let image: String
    let releaseDate: String
}

class FirestoreManager {
    static var shared = FirestoreManager()
    
    private init() {}
    
    var completionHandlerGetMovie: ([MovieFirestore]) -> Void = {_ in}
    
    private let database = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    public func writeDataToFirestore(title: String, description: String, releaseDate: String, image: UIImageView, uid: Int, nameImage: String) {
        let documentReference = database.collection("movie").document("\(uid)")
        if isMovieExist(uid) == false {
            return 
        } else {
            dowloadURL(image: image, nameImage: nameImage) { url in
                if let newURL = url {
                    documentReference.setData ( ["id": uid,
                                                 "title": title,
                                                 "image": newURL,
                                                 "description": description,
                                                 "releaseDate": releaseDate] )
                } else {
                    print("Image not found.")
                }
            }
        }
    }
    
    public func readDataToFirestore() {
        var movieArray: [MovieFirestore] = []
        
        let documentReference = database.collection("movie")
        
        documentReference.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                return
            }
            for document in documents {
                
                let data = document.data()
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let releaseDate = data["releaseDate"] as? String ?? ""
                
                let newMovie = MovieFirestore( title: title,
                                               description: description,
                                               image: image,
                                               releaseDate: releaseDate)
                movieArray.append(newMovie)
            }
            self.completionHandlerGetMovie(movieArray)
        }
    }
    
    private func isMovieExist(_ uid: Int) -> Bool {
        let documentReference = database.collection("movie").document("\(uid)")
        
        documentReference.getDocument { document, error in
            if let document = document {
                if document.exists {
                    print("Movie already exists. Document data: \(String(describing: document.data()))")
                    return 
                }
            }
        }
        return true
    }
    
    private func dowloadURL(image: UIImageView, nameImage: String, completion: @escaping (String?) -> Void ) {
        let ref = self.storage.child("images/\(nameImage)")
        
        guard let imageData = image.image?.pngData() else {
            completion(nil)
            return
        }
        ref.putData(imageData) { data, error in
            guard error == nil else {
                completion(nil)
                print("Failed to upload")
                return
            }
            ref.downloadURL { url, error in
                guard let url = url, error == nil else {
                    completion(nil)
                    return
                }  
                completion("\(url)")
            }
        }
    }
}
