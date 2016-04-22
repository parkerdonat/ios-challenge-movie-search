//
//  MovieController.swift
//  MovieSearch
//
//  Created by Parker Donat on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static func searchForMovies(searchString: String, completion: (movieArray: [Movie]) -> Void) {
        
        let key = "9730fb5307b38c315c5b99aa52f32f31"
        let base = "https://api.themoviedb.org/3/movie"
        let addPlusSignForSpaceInSearchTerm = searchString.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let url = base + "?query=\(addPlusSignForSpaceInSearchTerm)" + "&api_key=\(key)"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data,
                json = NetworkController.serializeDataWithReturn(data),
                movieArray = json["results"] as? [[String: AnyObject]] where success
                else { completion(movieArray: []); return }
            
            let movies = movieArray.flatMap{ Movie(dictionary: $0)}
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(movieArray: movies)
            })
        }
    }
    
    static func posterURLForString(movie: Movie) -> String {
        return "http://image.tmdb.org/t/p/w500/\(movie.posterEndpoint)"
    }
}