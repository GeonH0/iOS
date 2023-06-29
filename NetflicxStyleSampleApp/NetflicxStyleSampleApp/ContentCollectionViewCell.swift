//
//  ContentCollectionViewCell.swift
//  NetflicxStyleSampleApp
//
//  Created by 김건호 on 2023/06/29.
//

import UIKit
import SnapKit

class ContentCollectionViewCell : UICollectionViewCell{
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView)
        
        //use SnapKit
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
