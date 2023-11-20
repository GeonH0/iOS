//
//  MyViewController.swift
//  StoryBoad
//
//  Created by 김건호 on 11/6/23.
//

import UIKit

protocol AdminDelegate {
    
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var admin  : Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        admin = Admin(delegate: self)
    }
    
    
    @IBAction func didTabButton(_ sender: Any) {
        helloLabel.text = "Hello \(nameTextField.text!)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MyViewController : AdminDelegate {
    func doTask() {
        print("TASKING")
    }
    
    
}

struct Admin {
    var delegate : AdminDelegate
}
