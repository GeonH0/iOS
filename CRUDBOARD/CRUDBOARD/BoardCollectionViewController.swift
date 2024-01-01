//
//  BoardCollectionViewController.swift
//  CRUDBOARD
//
//  Created by 김건호 on 11/20/23.
//

import UIKit


class BoardCollectionViewController: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    var dataGroup1 = ["Item 1-1", "Item 1-2", "Item 1-3"]
       var dataGroup2 = ["Item 2-1", "Item 2-2", "Item 2-3", "Item 2-4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()

        // Compositional Layout 정의
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            // 섹션에 대한 정의
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)

            return section
        }

        // Compositional Layout 설정
        collectionView.collectionViewLayout = layout

        // 셀 등록
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BoardCollectionViewCell")

        // 데이터 적용
        applySnapshot()
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCollectionViewCell", for: indexPath) as? BoardCollectionViewCell else {
                fatalError("Unable to dequeue MyCollectionViewCell")
            }
            cell.backgroundColor = UIColor.lightGray
            cell.label.text = indexPath.section == 0 ? self.dataGroup1[indexPath.item] : self.dataGroup2[indexPath.item]
            return cell
        }
    }

    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0, 1]) // 2개의 섹션
        snapshot.appendItems(dataGroup1, toSection: 0) // 첫 번째 섹션의 아이템들
        snapshot.appendItems(dataGroup2, toSection: 1) // 두 번째 섹션의 아이템들 섹션의 아이템들
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
