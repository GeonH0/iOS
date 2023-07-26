//
//  ContentCollectionViewRankCell.swift
//  NetflicxStyleSampleApp
//
//  Created by 김건호 on 2023/07/26.
//

import UIKit

class ContentCollectionViewRankCell : UICollectionViewCell {
    let imageView  = UIImageView()
    let rankLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //content
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        //imageView
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        //autolayout
        contentView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        //rankLabel
        rankLabel.font = .systemFont(ofSize: 100,weight: .black)
        rankLabel.textColor = .white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
    }
}
