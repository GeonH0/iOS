//
//  HomeView.swift
//  KTV
//
//  Created by 김건호 on 12/4/24.
//

import UIKit

final class HomeView: UIView {
    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addsubview()
        setUpConstraint()
        setUpTable()
    }
    
    private func addsubview() {
        addSubview(tableView)
    }

    private func setUpConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "bg")
        
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 양 옆 여백
        tableView.rowHeight = HomeViewCell.height
    }
}

extension HomeView: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .video:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .video:
            return tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 셀의 contentView에 마진 추가
        cell.contentView.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0) // 위아래 간격 8
        cell.contentView.layer.cornerRadius = 16
        cell.contentView.layer.masksToBounds = true
    }
}

