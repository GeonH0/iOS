//
//  Board.swift
//  CRUDBOARD
//
//  Created by 김건호 on 11/20/23.
//

import Foundation
import UIKit

class Board : UIViewController {
    
    @IBOutlet weak var BoardCollectionView: UICollectionView!
    
    fileprivate let systemImageNameArray = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BoardCollectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        BoardCollectionView.dataSource = self
        BoardCollectionView.delegate = self
    }
    


}

extension Board : UICollectionViewDelegate {
    
}

extension Board : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    
    //각 콜렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCollectionViewCell", for: indexPath) as! BoardCollectionViewCell
        cell.profileImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
        cell.label.text = self.systemImageNameArray[indexPath.item]
        return cell
    }
    
    
}

