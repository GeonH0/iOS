//
//  EnterEmailViewController.swift
//  loginbySpotify
//
//  Created by 김건호 on 2023/04/13.
//

import UIKit

class EnterEmailViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 30
        
        loginButton.isEnabled = false
        //처음에는 비활성화
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        //화면이 켜졌을때 커서가 emailtextfiled로 잡히게 해준다.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationbar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
    }
    
}

extension EnterEmailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    } // 작성 완료시 키보드를 내려준다.
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        loginButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    } // login 버튼을 활성화 시켜준다.
}


