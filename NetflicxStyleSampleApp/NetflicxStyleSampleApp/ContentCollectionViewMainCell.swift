//
//  ContentCollectionViewMainCell.swift
//  NetflicxStyleSampleApp
//
//  Created by 김건호 on 2023/07/27.
//

import UIKit

class ContentCollectionViewMainCell : UICollectionViewCell {
    
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackView = UIStackView()
    
    let plusButton = UIButton()
    let playBUtton = UIButton()
    let infoButton = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView,menuStackView].forEach{
            contentView.addSubview($0)
        }
        
        //baseStackView
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        [imageView,descriptionLabel,contentStackView].forEach{
            baseStackView.addArrangedSubview($0)
        }
        
        //ImageView
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints{
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        //DescriptionLabel
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        //ContentStackView
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        [plusButton,infoButton].forEach {
            contentStackView.addArrangedSubview($0)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
        }
        
        plusButton.setTitle("내가 찜한 콘텐츠", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        
        infoButton.setTitle("정보", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
        
        contentStackView.addArrangedSubview(playBUtton)
        playBUtton.setTitle("재생", for: .normal)
        playBUtton.setTitleColor(.blue, for: .normal)
        playBUtton.backgroundColor = .white
        playBUtton.layer.cornerRadius = 3
        playBUtton.snp.makeConstraints{
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        playBUtton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
    
        contentStackView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(30)
            
            
        }
        
        
        baseStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        //menuStackView
        menuStackView.axis = .horizontal
        menuStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        [tvButton,movieButton,categoryButton].forEach{
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 3
        }
        tvButton.setTitle("TV 프로그램", for: .normal)
        movieButton.setTitle("영화", for: .normal)
        categoryButton.setTitle("카테고리 ", for: .normal)
        
        //action 추가
        tvButton.addTarget(self, action: #selector(tvButtonTapped), for: .touchUpInside)
        movieButton.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        
        menuStackView.snp.makeConstraints{
            $0.top.equalTo(baseStackView)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    @objc func tvButtonTapped(sender : UIButton!){
        print("Test: TV Button Tapped")
    }
    @objc func movieButtonTapped(sender : UIButton!){
        print("Test: Movie Button Tapped")
    }

    @objc func categoryTapped(sender : UIButton!){
        print("Test: Category Button Tapped")
    }
    @objc func plusTapped(sender : UIButton!){
        print("Test: Plus Button Tapped")
    }
    @objc func infoTapped(sender : UIButton!){
        print("Test: Info Button Tapped")
    }
    @objc func playTapped(sender : UIButton!){
        print("Test: Play Button Tapped")
    }

}
