//
//  Movie.swift
//  MovieSearch
//
//  Created by Parker Donat on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kSummary = "overview"
    private let kPoster = "poster_path"
    
    
    let title: String
    let rating: Float
    let summary: String
    let posterEndpoint: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            let rating = dictionary[kRating] as? Float,
            let summary = dictionary[kSummary] as? String,
            let posterEndpoint = dictionary[kPoster] as? String else { return nil }
        self.title = title
        self.summary = summary
        self.rating = rating
        self.posterEndpoint = posterEndpoint
    }
}