//
//  MovieContinueTableViewCell.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 13/01/21.
//

import UIKit

class MovieContinueCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "teste"
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: INTERFACE
    private func setupViews(){
        addSubview(titleLabel)
        constraint(pattern: "H:|[v0]|", views: titleLabel)
        constraint(pattern: "V:[v0(40)]|", views: titleLabel)
    }

}
