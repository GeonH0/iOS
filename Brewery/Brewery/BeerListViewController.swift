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

extension BeerListViewController {
    
}
