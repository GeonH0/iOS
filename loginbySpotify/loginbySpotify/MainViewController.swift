//
//  MainVeiwController.swift
//  loginbySpotify
//
//  Created by 김건호 on 2023/04/13.
//

import UIKit
import FirebaseAuth

class MainViewController : UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
        환영합니다.
        \(email)님
        """

    }
    
    
    
    @IBAction func logoutButtonTap(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
