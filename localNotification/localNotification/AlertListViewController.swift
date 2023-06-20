//
//  AlertListViewController.swift
//  localNotification
//
//  Created by 김건호 on 2023/06/20.
//


import UIKit

class AlertListViewController : UITableViewController{
    
    var alertList:[Alert] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
    }
    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
        
        
    }
}

// UITabelView dataSource,Delegate
extension AlertListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertList.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0 :
            return "물마실 시간"
        default :
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell()}
        
        cell.alertSwitch.isOn = alertList[indexPath.row].isOn
        cell.timeLabel.text =  alertList[indexPath.row].time
        cell.meridiemLabel.text = alertList[indexPath.row].meridiem
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle{
        case .delete:
            //notification delete
            return
        return
            
        default:
            break
        }
    }
    
    
    
}
