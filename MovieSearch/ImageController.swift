//
//  ImageController.swift
//  MovieSearch
//
//  Created by Parker Donat on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: (image: UIImage?) -> Void) {
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data where success else { completion(image: nil); return }
            let image = UIImage(data: data)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(image: image)
            })
        }
    }
}