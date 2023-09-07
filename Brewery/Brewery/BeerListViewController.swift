//
//  BeerListViewController.swift
//  Brewery
//
//  Created by 김건호 on 2023/07/28.
//

import UIKit

class BeerListViewController : UITableViewController{
    var beerList = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UiNavigationBar
        title = "브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


//UITableView DataSource,Delegate
extension BeerListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
}
