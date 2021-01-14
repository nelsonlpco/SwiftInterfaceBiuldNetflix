//
//  CollectionMovieView.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 13/01/21.
//

import UIKit

class CollectionMovieView: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let collectionID = "collectionID"
    let collectionID2 = "collectionID2"
    
    var type: Bool = false
    
    var movies: [Movie]?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cl = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)    
        cl.delegate = self
        cl.dataSource = self
        cl.backgroundColor = UIColor.fromHex(0x313131)
        
        return cl
    }()
    
    override init() {
        super.init()
        
        collectionView.register(MovieContinueCollectionViewCell.self, forCellWithReuseIdentifier: collectionID)
        collectionView.register(FeedMovieTVC.self, forCellWithReuseIdentifier: collectionID2)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionID, for: indexPath) as! MovieContinueCollectionViewCell
            cell.backgroundColor = .yellow
            cell.titleLabel.text = movies?[indexPath.row].title ?? nil
        
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionID2, for: indexPath) as! FeedMovieTVC
            
            cell.backgroundColor = .brown
            cell.titleLabel.text = movies?[indexPath.row].title ?? nil
        
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width * ( type ? 0.6 : 0.29 )
        let spectRatio: CGFloat = type ? 3/4 : 16/9
        let height: CGFloat = width * spectRatio
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("teste")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
