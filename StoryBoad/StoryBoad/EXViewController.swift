//
//  EXViewController.swift
//  StoryBoad
//
//  Created by 김건호 on 11/20/23.
//

import UIKit

struct TodoItem {
    var title : String
    var isCompleted : Bool
}

class EXViewController: UIViewController {

    @IBOutlet weak var ExtableView: UITableView!
    var data : [TodoItem] = [
        TodoItem(title: "운동하기", isCompleted: false),
        TodoItem(title: "밥먹기", isCompleted: false),
        TodoItem(title: "휴식", isCompleted: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        ExtableView.dataSource = self
        ExtableView.delegate = self

        // Do any additional setup after loading the view.
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
extension EXViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료"){
            action,view,completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            self.ExtableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExtableView.dequeueReusableCell(withIdentifier: "EXCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        
        if data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .green
            cell.imageView?.isHidden = true
        } else {
            cell.textLabel?.textColor = .red
            cell.imageView?.isHidden = false
        }
        
        return cell
    }
    
    
}
