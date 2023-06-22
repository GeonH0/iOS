//
//  AddAlertViewController.swift
//  localNotification
//
//  Created by 김건호 on 2023/06/22.
//

import UIKit

class AddAlertViewController : UIViewController{
    
    var pickedDate : ((_ date: Date)-> Void)?
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true,completion: nil)
    }
}
