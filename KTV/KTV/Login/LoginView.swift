//
//  LoginView.swift
//  KTV
//
//  Created by 김건호 on 9/10/24.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didtapLoginButton()
}

final class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    private let logoimage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "launchImage")
        logoImage.contentMode = .scaleAspectFill
        logoImage.clipsToBounds = true
        return logoImage
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 19
        loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.delegate?.didtapLoginButton()
                }),
            for: .touchUpInside)
        return loginButton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews()
        setupConstraints()
    }
    private func addSubviews() {
        addSubview(logoimage)
        addSubview(loginButton)
    }
    private func setupConstraints() {
        logoimage.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoimage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoimage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loginButton.topAnchor.constraint(equalTo: logoimage.bottomAnchor, constant: 52),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
}
