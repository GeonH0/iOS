//
//  MainTabBarView.swift
//  Blog
//
//  Created by 김건호 on 1/22/25.
//

import UIKit

protocol CustomTabBarViewDelegate: AnyObject {
    func tabBarView(_ tabBarView: MainTabBarView, didSelectTabAt index: Int)
}

class MainTabBarView: UIView {
    weak var delegate: CustomTabBarViewDelegate?

    private var buttons: [UIButton] = []
    private let indicatorView = UIView()
    private let separatorView = UIView()
    
    private var currentSelectedIndex: Int = 0

    func configure(with images: [UIImage]) {
        buttons.forEach { $0.removeFromSuperview() }
        buttons = []

        for (index, image) in images.enumerated() {
            let button = UIButton(type: .system)
            
            // UIButtonConfiguration 사용
            var config = UIButton.Configuration.plain()
            config.image = image.withRenderingMode(.alwaysTemplate)
            config.imagePadding = 0 // 이미지와 텍스트 간 거리
            config.baseForegroundColor = .gray
            config.contentInsets = NSDirectionalEdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0) // 이미지 상단 이동

            button.configuration = config // 설정 적용
            button.tintColor = .gray
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            addSubview(button)
        }

        setNeedsLayout()
        layoutIfNeeded()
        updateIndicatorPosition(animated: false)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSeparatorView()
        setupIndicatorView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSeparatorView()
        setupIndicatorView()
    }

    private func setupSeparatorView() {
        separatorView.backgroundColor = .lightGray
        addSubview(separatorView)
    }

    private func setupIndicatorView() {
        indicatorView.backgroundColor = .systemBlue
        addSubview(indicatorView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // 구분선 위치 설정
        separatorView.frame = CGRect(x: 0, y: -5, width: bounds.width, height: 1)

        // 버튼 레이아웃 설정
        let buttonWidth = bounds.width / CGFloat(buttons.count)
        let buttonHeight = bounds.height
        for (index, button) in buttons.enumerated() {
            button.frame = CGRect(
                x: CGFloat(index) * buttonWidth,
                y: 0,
                width: buttonWidth,
                height: buttonHeight
            )
            button.imageView?.contentMode = .scaleAspectFit
        }

        // 슬라이딩 인디케이터 초기화
        updateIndicatorPosition(animated: false)
    }

    private func updateIndicatorPosition(animated: Bool) {
        guard !buttons.isEmpty else { return }

        let buttonWidth = bounds.width / CGFloat(buttons.count)
        let targetX = CGFloat(currentSelectedIndex) * buttonWidth
        let indicatorFrame = CGRect(
            x: targetX,
            y: -5,
            width: buttonWidth,
            height: 3 // 인디케이터 높이
        )

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.indicatorView.frame = indicatorFrame
            }
        } else {
            indicatorView.frame = indicatorFrame
        }
    }

    @objc private func tabButtonTapped(_ sender: UIButton) {
        currentSelectedIndex = sender.tag
        updateIndicatorPosition(animated: true)
        delegate?.tabBarView(self, didSelectTabAt: sender.tag)
    }
}
