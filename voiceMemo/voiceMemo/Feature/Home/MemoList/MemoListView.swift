//
//  MemoListView.swift
//  voiceMemo
//

import SwiftUI

struct MemoListView: View {
    @EnvironmentObject private var pathModel : PathModel
    @EnvironmentObject private var memoListViewModel : MemoListViewModel
    @EnvironmentObject private var homeviewModel : HomeViewModel
    var body: some View {
        ZStack {
            VStack{
                if !memoListViewModel.memos.isEmpty {
                    CustomNavigationBar(
                        isDisplayLeftButn: false,
                        rightBtnAction: {
                            memoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: memoListViewModel.navigationBarRightBtnMode
                        
                    )
                } else {
                    Spacer()
                        .frame(height: 30)
                    
                }
                
                // title view
                TitleVIew()
                    .padding(.top,20)
                
                if memoListViewModel.memos.isEmpty {
                    AnnouncementView()
                } else {
                    MemoListContentView()
                        .padding(.top,20)
                }
                // content view
                
                //icon button view
                
            }
            
            WriteMemoBtnView()
                .padding(.trailing,20)
                .padding(.bottom,50)
        }
        .alert("메모\(memoListViewModel.removeMemoCount)개 삭제 하시겠습니까?",
               isPresented: $memoListViewModel.isDisplayRemoveMemoAlert){
            Button("삭제",role: .destructive){
                memoListViewModel.removeBtnTapped()
            }
            Button("취소",role: .cancel){
                
            }
            .onChange(
                of: memoListViewModel.memos,
                perform: { memos in
                    homeviewModel.setMemosCount(memos.count)                    
                })
        }
        
    }
}

private struct TitleVIew : View {
    @EnvironmentObject private var memoListViewModel : MemoListViewModel
    var body: some View {
        HStack{
            if memoListViewModel.memos.isEmpty {
                Text("메모를\n추가해 보세요.")
            } else {
                Text("메모 \(memoListViewModel.memos.count)개가\n있습니다.")
            }
            Spacer()
        }
        .font(.system(size: 30,weight: .bold))
        .padding(.leading,20)
    }
}

private struct AnnouncementView : View {
    var body: some View {
        VStack(spacing : 15) {
            Spacer()
            
            Image("pencil")
                .renderingMode(.template)
            Text("\"퇴근 9시간전 메모\"")
            Text("\"강의 듣기\"")
            Text("\"알고리즘 공부 하기\"")
            
            Spacer()
        }
        .font(.system(size: 16))
        .foregroundColor(.customGray2)
    }
}

private struct MemoListContentView : View {
    @EnvironmentObject private var memoListViewModel : MemoListViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("메모 목록")
                    .font(.system(size: 16,weight: .bold))
                    .padding(.leading,20)
                
                Spacer()
            }
            ScrollView(.vertical){
                VStack (spacing: 0){
                    Rectangle()
                        .fill(Color.customGray0)
                        .frame(height: 1)
                    
                    ForEach(memoListViewModel.memos , id : \.self) { memo in
                        MemoCellView(memo: memo)
                        
                    }
                    
                }
            }
        }
    }
}

private struct MemoCellView : View {
    @EnvironmentObject private var pathModel : PathModel
    @EnvironmentObject private var memoListViewModel : MemoListViewModel
    @State private var isRemoveSelected : Bool
    private var memo : Memo
    
    init(
        isRemoveSelected: Bool = false,
        memo: Memo
    ) {
        
        _isRemoveSelected = State(initialValue: isRemoveSelected)
        self.memo = memo
    }
    
    var body: some View {
        Button(
            action: {
                pathModel.paths.append(.MemoView(isCreatedMode: false, memo: memo))
            },
            label: {
                VStack(spacing: 10){
                    HStack{
                        VStack(alignment: .leading){
                            Text(memo.title)
                                .lineLimit(1)
                                .font(.system(size: 16))
                                .foregroundColor(.customBlack)
                            
                            Text(memo.convertedDate)
                                .font(.system(size: 12))
                                .foregroundColor(.customIconGray)
                        }
                        
                        Spacer()
                        
                        if memoListViewModel.isEditMemoMode {
                            Button(
                                action: {
                                    isRemoveSelected.toggle()
                                    memoListViewModel.memoRemoveSelectedBoxTapped(memo)
                                },
                                label: {
                                    isRemoveSelected ? Image("selectedBox") : Image("unSelectedBox")}
                            )
                        }
                        
                    }
                    .padding(.horizontal,30)
                    .padding(.top,10)
                    
                    Rectangle()
                        .fill(Color.customGray0)
                        .frame(height: 1)
                }
                
            }
        )
    }
}


// MARK: - 메모 작성 버튼 뷰
private struct WriteMemoBtnView : View {
    @EnvironmentObject private var pathModel : PathModel
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                Button(
                    action: {
                        pathModel.paths.append(.MemoView(isCreatedMode: true, memo: nil))
                    },
                    label: {
                        Image("writeBtn")
                    })
            }
            
            
        }
    }
}





struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
            .environmentObject(PathModel())
            .environmentObject(MemoListViewModel())
    }
}
