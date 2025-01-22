//
//  HomeViewController.swift
//  KTV
//
//  Created by 김건호 on 12/4/24.
//

import UIKit

final class HomeViewController: UIViewController {
    private var contentView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        view = contentView        
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "bg")
    }
}
