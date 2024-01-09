//
//  PathType.swift
//  voiceMemo
//

enum PathType : Hashable {
    case homeView
    case todoView
    case MemoView(isCreatedMode : Bool, memo : Memo?)
}
