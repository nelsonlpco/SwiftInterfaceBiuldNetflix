//
//  Movie.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 13/01/21.
//

import Foundation

class Movie {
    var id: String
    var imgUrl: String
    var title: String?
    var description: String?
    
    init(id: String = UUID().uuidString, imgUrl: String, title: String?, description: String?) {
        self.id = id
        self.imgUrl = imgUrl
        self.title = title
        self.description = description
    }
}
