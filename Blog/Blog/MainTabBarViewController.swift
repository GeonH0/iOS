//
//  MainTabBarViewController.swift
//  Blog
//
//  Created by 김건호 on 1/22/25.
//

import UIKit

class MainTabBarViewController: UIViewController {
    private let customTabBar = MainTabBarView()
    private var viewControllers: [UIViewController] = []
    private var currentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setViewControllers(_ controllers: [UIViewController], images: [UIImage]) {
        viewControllers = controllers
        customTabBar.configure(with: images)
        selectTab(at: 0)
    }
    
    private func setupTabBar() {
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.delegate = self
        view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func selectTab(at index: Int) {
        guard index >= 0 && index < viewControllers.count else { return }
        
        let selectedVC = viewControllers[index]
        
        if currentViewController == selectedVC {
            return // 동일 탭 선택 시 아무 작업도 하지 않음
        }
        
        let oldVC = currentViewController
        currentViewController?.willMove(toParent: nil)
        
        addChild(selectedVC)
        selectedVC.view.frame = view.bounds.offsetBy(dx: index > (oldVC.flatMap { viewControllers.firstIndex(of: $0) } ?? 0) ? view.bounds.width : -view.bounds.width, dy: 0)
        selectedVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(selectedVC.view, belowSubview: customTabBar)
        
        UIView.animate(withDuration: 0.3, animations: {
            selectedVC.view.frame = self.view.bounds
            oldVC?.view.frame = oldVC?.view.frame.offsetBy(dx: index > (oldVC.flatMap { self.viewControllers.firstIndex(of: $0) } ?? 0) ? -self.view.bounds.width : self.view.bounds.width, dy: 0) ?? CGRect.zero
        }) { _ in
            oldVC?.view.removeFromSuperview()
            oldVC?.removeFromParent()
            
            selectedVC.didMove(toParent: self)
            self.currentViewController = selectedVC
        }
    }
}

extension MainTabBarViewController: CustomTabBarViewDelegate {
    func tabBarView(_ tabBarView: MainTabBarView, didSelectTabAt index: Int) {
        selectTab(at: index)
    }
}
