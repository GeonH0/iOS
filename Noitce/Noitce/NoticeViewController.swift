//
//  NoticeViewController.swift
//  Noitce
//
//  Created by 김건호 on 2023/06/18.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var noticeContents: (title: String, detail: String, date: String)?

    @IBOutlet weak var noticeView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noticeView.layer.cornerRadius =  6
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //기본 view의 backgroud color
        
        guard let noticeContents = noticeContents else {return} // optional 처리
        titleLabel.text = noticeContents.title
        detailLabel.text = noticeContents.detail
        dateLabel.text = noticeContents.date
                
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
