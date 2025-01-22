//
//  TextInteractor.swift
//  Blog
//
//  Created by 김건호 on 1/2/25.
//

protocol TextInteractor {
    func updateTitle(_ title: String)
    func updateDescription(_ description: String)
    func loadTextData()
    func saveTextData()
}

final class TextInteractorImpl: TextInteractor {
    private var title: String = ""
    private var description: String = ""

    func updateTitle(_ title: String) {
        self.title = title
    }

    func updateDescription(_ description: String) {
        self.description = description
    }

    func loadTextData() {
        print("Loading data... Title: \(title), Description: \(description)")
    }

    func saveTextData() {
        print("Saving data...")
        print("Title: \(title)")
        print("Description: \(description)")
    }
}
