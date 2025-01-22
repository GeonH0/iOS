//
//  LoginViewController.swift
//  KTV
//
//  Created by 김건호 on 9/10/24.
//

import UIKit

final class LoginViewController: UIViewController {
    private let contentView = LoginView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        setUpView()
        contentView.delegate = self
    }
    
    private func setUpView() {
        view.backgroundColor = UIColor(named: "main-yellow")
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LoginViewController: LoginViewDelegate {
    func didtapLoginButton() {
        self.view.window?.rootViewController = MainTabbarViewController()
    }
}

