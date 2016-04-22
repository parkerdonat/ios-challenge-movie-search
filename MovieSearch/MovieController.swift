//
//  MovieController.swift
//  MovieSearch
//
//  Created by Parker Donat on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static func searchForMovie(title: String, completion: (movies: [Movie]?) -> Void) {
        
        let url = "http://api.themoviedb.org/3/search/movie?query=\(title)&api_key=68a8779098e355ac704c413416c684af"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data,
                let json = NetworkController.serializeDataWithReturn(data) else {completion(movies: []); return }
            
            
            let movieArray = json[Movie.kResults] as! [[String: AnyObject]]
            
            let movies = movieArray.flatMap{ Movie(dictionary: $0)}
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(movies: movies)
            })
        }
    }
}