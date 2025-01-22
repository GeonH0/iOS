//
//  TextViewController.swift
//  Blog
//
//  Created by 김건호 on 1/2/25.
//

import UIKit

final class TextViewController: UIViewController, TextViewDelegate {
    private let contentView = TextView()
    private let interactor: TextInteractor

    init(interactor: TextInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
        contentView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadTextData()
    }

    // MARK: - TextViewDelegate
    func didTapSaveButton(title: String, description: String) {
        print("Save Button Tapped!")
        interactor.updateTitle(title)
        interactor.updateDescription(description)
        interactor.saveTextData()
    }
}

