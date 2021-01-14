//
//  FeedMovieTableViewCell.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 13/01/21.
//

import UIKit

class FeedMovieTableViewCell: UITableViewCell {
    
    var movies: [Movie]? {
        didSet {
            self.collectionMovieView.movies = movies
        }
    }
    
    var type: Bool? {
        didSet {
            self.collectionMovieView.type = type ?? false
        }
    }
    
    var collectionMovieView: CollectionMovieView = {
        return CollectionMovieView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -  interface
    private func setupView() {
        addSubview(collectionMovieView.collectionView)
        bringSubviewToFront(collectionMovieView.collectionView)
        collectionMovieView.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        constraint(pattern: "H:|[v0]|", views: collectionMovieView.collectionView)
        constraint(pattern: "V:|[v0]|", views: collectionMovieView.collectionView)
    }
}
