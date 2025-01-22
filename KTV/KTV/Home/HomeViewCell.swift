//
//  HomeViewCell.swift
//  KTV
//
//  Created by 김건호 on 12/4/24.
//

import UIKit

final class HomeViewCell: UITableViewCell {
    static let identifier = "HomeViewCell"
    static let height: CGFloat = 321

    // 컨테이너 뷰 추가
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg") // 셀의 배경색 설정
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        view.layer.borderWidth = 2
        view.layer.masksToBounds = true // 둥근 모서리 내부 내용 제한
        return view
    }()

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "stroke-light")
        return view
    }()

    private let hotImageView: UIImageView = {
        let hotImageView = UIImageView()
        hotImageView.image = UIImage(named: "hot")
        hotImageView.contentMode = .scaleToFill
        return hotImageView
    }()

    private let hotTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "main-wh")
        label.text = "Title"
        return label
    }()

    private let hotSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "main-wh")
        label.text = "Subtitle. sub-description"
        return label
    }()

    private let channelImageView: UIImageView = {
        let showImage = UIImageView()
        showImage.contentMode = .scaleAspectFit
        return showImage
    }()

    private let channelTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = UIColor(named: "main-wh")
        titleLabel.text = "Title"
        return titleLabel
    }()

    private let channelSubtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textColor = UIColor(named: "main-wh")
        subtitleLabel.text = "Subtitle. sub-description"
        return subtitleLabel
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(named: "my_like"),
            for: .normal
        )
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .clear // 셀 자체 배경을 투명하게
        contentView.backgroundColor = UIColor(named: "bg") // contentView의 배경색 설정
        selectionStyle = .none // 선택 효과 제거
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        // 컨테이너 뷰 추가
        contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(separatorView)
        containerView.addSubview(hotImageView)
        containerView.addSubview(hotTitleLabel)
        containerView.addSubview(hotSubtitleLabel)
        containerView.addSubview(channelImageView)
        containerView.addSubview(channelTitleLabel)
        containerView.addSubview(channelSubtitleLabel)
        containerView.addSubview(likeButton)

        setupConstraints()
    }

    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        hotImageView.translatesAutoresizingMaskIntoConstraints = false
        hotTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        hotSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        channelImageView.translatesAutoresizingMaskIntoConstraints = false
        channelTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        channelSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // 컨테이너 뷰의 여백 설정
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Profile Image Constraints
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            profileImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),

            // Separator View Constraints
            separatorView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),

            // Hot Image Constraints
            hotImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 21),
            hotImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            hotImageView.widthAnchor.constraint(equalToConstant: 44),
            hotImageView.heightAnchor.constraint(equalToConstant: 20),

            // Hot Title Label Constraints
            hotTitleLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 21),
            hotTitleLabel.leadingAnchor.constraint(equalTo: hotImageView.trailingAnchor, constant: 8),

            // Hot Subtitle Label Constraints
            hotSubtitleLabel.topAnchor.constraint(equalTo: hotTitleLabel.bottomAnchor, constant: 4),
            hotSubtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            hotSubtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),

            // Channel Image Constraints
            channelImageView.topAnchor.constraint(equalTo: hotSubtitleLabel.bottomAnchor, constant: 8),
            channelImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            channelImageView.widthAnchor.constraint(equalToConstant: 40),
            channelImageView.heightAnchor.constraint(equalToConstant: 40),

            // Channel Title Label Constraints
            channelTitleLabel.topAnchor.constraint(equalTo: channelImageView.topAnchor),
            channelTitleLabel.leadingAnchor.constraint(equalTo: channelImageView.trailingAnchor, constant: 8),
            channelTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),

            // Channel Subtitle Label Constraints
            channelSubtitleLabel.topAnchor.constraint(equalTo: channelTitleLabel.bottomAnchor, constant: 8),
            channelSubtitleLabel.leadingAnchor.constraint(equalTo: channelImageView.trailingAnchor, constant: 8),
            channelSubtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),

            // Like Button Constraints
            likeButton.centerYAnchor.constraint(equalTo: channelSubtitleLabel.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
