//
//  MovieMock.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 13/01/21.
//

import Foundation

class MovieMock {
    let highLight = Movie(imgUrl: "", title: nil, description: nil)
    
    let movies: [Int: (String, [Movie])] = [
        0: ("continue" , [
            Movie(imgUrl: "516446", title: "Title 1", description: "Descrição filme 1"),
            Movie(imgUrl: "516446", title: "Title 2", description: "Descrição filme 2"),
        ]),
        1: ("recent", [
            Movie(imgUrl: "516446", title: "Title 3", description: "Descrição filme 3"),
            Movie(imgUrl: "516446", title: "Title 4", description: "Descrição filme 4"),
        ])
    ]
}

protocol FeedMovieDelegate {
    func response(status: Int, feed: MovieMock)
}
