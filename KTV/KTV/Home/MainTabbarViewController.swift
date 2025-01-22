//
//  MainTabbarViewController.swift
//  KTV
//
//  Created by 김건호 on 9/22/24.
//

import UIKit

final class MainTabbarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "bg")
        setupTabBar()
        
    }
    
    private func setupTabBar() {
        let mainView = HomeViewController()
        let liveView = LiveViewController()
        let mypageView = MypageViewController()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor(named: "stroke-light")
        appearance.backgroundColor = UIColor(named: "bg")
                    
        mainView.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tabIcon_home"),
            selectedImage: UIImage(named: "tabIcon_home_selected")
        )
        liveView.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tabIcon_live"),
            selectedImage: UIImage(named: "tabIcon_live_selected")
        )
        mypageView.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tabIcon_my"),
            selectedImage: UIImage(named: "tabIcon_my_selected")
        )
                
        viewControllers = [mainView, liveView, mypageView]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
}
