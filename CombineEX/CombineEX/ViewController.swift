//
//  ViewController.swift
//  CombineEX
//
//  Created by 김건호 on 5/22/24.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    private let mainView = MainView()
    private var viewModel = MainViewModel(message: Message(text: "Initial Message"))
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView.button.addTarget(self, action: #selector(updateMessage), for: .touchUpInside)
        
        
        viewModel.$message
            .map { $0.text }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newText in
                self?.mainView.label.text = newText
            }
            .store(in: &cancellables)
    }
    
    @objc private func updateMessage() {
        viewModel.updateMessage()
    }
}

