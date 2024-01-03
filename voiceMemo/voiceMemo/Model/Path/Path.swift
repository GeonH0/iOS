//
//  Path.swift
//  voiceMemo
//

import Foundation

class PathModel : ObservableObject {
    @Published var pahts : [PathType]
    
    init(pahts: [PathType] = []) {
        self.pahts = pahts
    }
}
