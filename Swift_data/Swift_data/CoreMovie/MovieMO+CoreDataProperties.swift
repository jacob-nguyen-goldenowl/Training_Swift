//
//  MovieMO+CoreDataProperties.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 11/11/2022.
//
//

import Foundation
import CoreData
import UIKit

extension MovieMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieMO> {
        return NSFetchRequest<MovieMO>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var image: Data?
    @NSManaged public var releaseDate: String?
    
}

extension MovieMO : Identifiable {
    
    @discardableResult
    public func insertNewMovie(title: String, overview: String, image: UIImageView, releaseDate: String) -> MovieMO? {
        
        let context = AppDelegate.managerObjectContext
        guard let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: context!) as? MovieMO else {
            fatalError("Something error")
        }
        
        if isExist(title: title) == true {
            
            movie.title = title
            movie.image = image.image?.jpegData(compressionQuality: 0.9) as Data?
            movie.overview = overview
            movie.releaseDate = releaseDate
            
            do {
                try context?.save()
            } catch {
                let nserror = error as NSError
                print("Can not insert new movie. Error is: \(nserror), \(nserror.userInfo).")
            }
            
            print("Insert new movie with title: \(movie.title ?? "") successful.")
            return movie
            
        } else {
            print("Movie is duplicate.")
            context?.delete(movie)
            do {
                try context?.save()
            } catch {
                print("Error when delete item")
            }
            return nil
        }
                
    }
    
    public func getAllMovie() -> [MovieMO]? {
        
        var movies = [MovieMO]()
        let context = AppDelegate.managerObjectContext!
        do {
            movies = try context.fetch(MovieMO.fetchRequest())
        } catch {
            let nserror = error as NSError
            print("Fetching movie unsuccessful. Error is: \(nserror), \(nserror.userInfo).")
            return nil
        }
        return movies
        
    }
    
    public func deleteAllMovies() -> Bool {
        
        let context = AppDelegate.managerObjectContext!
        if let movies = self.getAllMovie() {
            for mv in movies {
                context.delete(mv)
            } 
        }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            print("Delete all movies unsuccessful. Error is: \(nserror), \(nserror.userInfo).")
            return false
        }
        print("Delete all movies successful.")
        return true
        
    }
    
    public func deleteOneMovie() {
        
    }
    
    private func isExist(title: String) -> Bool {
        
        let context = AppDelegate.managerObjectContext!
        let fetch = MovieMO.fetchRequest()
        fetch.fetchLimit = 1
        fetch.predicate = NSPredicate(format: "title == %@", title)
        let res = try! context.fetch(fetch)
        return res.count > 0 ? false : true
        
    }
    
}
