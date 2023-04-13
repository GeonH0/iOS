//
//  EnterEmailViewController.swift
//  loginbySpotify
//
//  Created by 김건호 on 2023/04/13.
//

import UIKit
import FirebaseAuth


class EnterEmailViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationbarchange()
        
        loginButton.layer.cornerRadius = 30
        
        loginButton.isEnabled = false
        //처음에는 비활성화
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        //화면이 켜졌을때 커서가 emailtextfiled로 잡히게 해준다.
    }
    
    
    func navigationbarchange(){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationbar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
        //Firebase 이메일 비번 인증
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //New
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] authResult,error in
            guard let self = self else { return }
            
            if let error = error{
                let code = (error as NSError).code
                switch code{
                case 17007: // 이미 가입한 계정일때
                    self.loginUser(withEmail: email, password: password)
                    //로그인 하기
                    
                default:
                    self.errorLabel.text = error.localizedDescription
                    
                    
                }
            }else
            {
                self.showMainViewController()
            }
            
            
                
        }
    }
    private func showMainViewController (){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email:String,password:String){
        Auth.auth().signIn(withEmail: email,password: password ){
            [weak self] _, error in
            guard let self = self else { return }
            
            if let error = error{
                errorLabel.text = error.localizedDescription
                
            }else{
                showMainViewController()
            }
            
        }
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


