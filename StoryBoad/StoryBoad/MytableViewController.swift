//
//  MytableViewController.swift
//  StoryBoad
//
//  Created by 김건호 on 11/20/23.
//

import UIKit



class MytableViewController: UIViewController {

    @IBOutlet weak var MytableView: UITableView!
    let cellData = ["Hello","BYE","HI","THIS IS UIKIT","HELLOWORLD"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        MytableView.backgroundColor = .green
        
        MytableView.delegate = self
        MytableView.dataSource = self

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

extension MytableViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text =  cellData[indexPath.row]
        return cell
    }
    
    
}





