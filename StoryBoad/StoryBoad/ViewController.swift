//
//  ViewController.swift
//  StoryBoad
//
//  Created by 김건호 on 11/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TouchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }

    @IBAction func didMyButtonTap(_ sender: Any) {
        print("HELLO WORLD")
    }
    
}

