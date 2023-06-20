//
//  ViewController.swift
//  Noitce
//
//  Created by 김건호 on 2023/06/18.
//

import UIKit
import FirebaseRemoteConfig
import FirebaseAnalytics

class ViewController: UIViewController {
    
    var remoteConfig: RemoteConfig?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        remoteConfig = RemoteConfig.remoteConfig()
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        //새로운 값을 패치 하는 인터벌값을 최소화 해서 최대한 자주 업데이트 값을 가지고 올수 있게 함
        
        remoteConfig?.configSettings = setting
        remoteConfig?.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNotice()
    }


}

extension ViewController {
    func getNotice() {
        guard let remoteConfig = remoteConfig else {return}
        
        remoteConfig.fetch{ [weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion:nil)
            } else {
                print("ERROR: Config not fetched")
            }
            
            guard let self = self else { return }
            if !self.isNoticeHidden(remoteConfig){
                let noticeVC = NoticeViewController(nibName: "NoticeViewController", bundle: nil)
                
                noticeVC.modalPresentationStyle = .custom
                noticeVC.modalTransitionStyle = .crossDissolve
                
                let title = (remoteConfig["title"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                //firebase에서 \n을 인식을 못하고 \\n으로 인식되기 때문에 \n으로 변환해준다.
                let detail = (remoteConfig["detail"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                
                let date = (remoteConfig["date"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                
                noticeVC.noticeContents = (title: title,detail:detail,date:date)
                self.present(noticeVC,animated: true,completion: nil)
            } else {
                showEventAlert()
            }
        }
        
    }
    
    func isNoticeHidden(_ remoteConfig: RemoteConfig) -> Bool {
        return remoteConfig["isHidden"].boolValue
        //remoteConfig의 isHidden값을 bool값으로 return 처리 해준다.
    }
}

extension ViewController {
    func showEventAlert() {
        guard let remoteConfig = remoteConfig else { return }
        
        remoteConfig.fetch { [weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion: nil)
                
                let message = remoteConfig["message"].stringValue ?? "바보"
                let confirmAction = UIAlertAction(title: "확인하기", style: .default) { action in
                    Analytics.logEvent("event_button_tapped", parameters: nil)
                }
                let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
                
                let alertController = UIAlertController(title: "깜짝 이벤트", message: message, preferredStyle: .alert)
                
                alertController.addAction(confirmAction)
                alertController.addAction(cancelAction)
                
                self?.present(alertController, animated: true, completion: nil)
            } else {
                print("Config not fetched")
            }
        }
    }
}
