//
//  NetflixApi.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 12/01/21.
//

import Foundation

class NetflixApi: NSObject {
    static let shared = NetflixApi()
    var delegate: FeedMovieDelegate!
    
    func request() {
        let delay = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.delegate.response(status: 200, feed: MovieMock())
        }
        
    }
}
