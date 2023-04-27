//
//  ViewController.swift
//  KaKaoLoginTest
//
//  Created by 김건호 on 2023/04/27.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth


class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginbyKakaoTalk(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카카오톡이 설치되어있는지 확인
          UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let error = error {
               print(error)
            } else {
               print("loginWithKakaoTalk() success.")
               //do something
               _ = oauthToken
            }
          }
        }
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
             print(error)
           }
           else {
            print("loginWithKakaoAccount() success.")
            
            //do something
            _ = oauthToken
           }
        }
          UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let error = error {
               print(error)
            } else {
               print("loginWithKakaoTalk() success.")
               //do something
               _ = oauthToken
                self.setUserInfo()
            }
          }
        
        
        }
    func setUserInfo() {
           UserApi.shared.me() {(user, error) in
               if let error = error {
                   print(error)
               }
               else {
                   print("me() success.")
                   //do something
                   _ = user
                   self.nameLabel.text = user?.kakaoAccount?.profile?.nickname
                   
                   if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                       let data = try? Data(contentsOf: url) {
                       
                   }
               }
           }
       }

    
}

