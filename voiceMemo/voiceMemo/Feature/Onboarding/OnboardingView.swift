//
//  OnboardingView.swift
//  voiceMemo
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var pathModel = PathModel()
    
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    @StateObject private var todoListViewModel  = TodoListViewModel()
    
    @StateObject private var memoListViewModel = MemoListViewModel()
    
    var body: some View {
        //MARK : - 화면 전환 구현 필요        
        NavigationStack(path: $pathModel.paths){
//            onboardingContentView(onbaordingViewModel: onboardingViewModel)
            TodoListView()
                .environmentObject(todoListViewModel)
                .navigationDestination(
                    for: PathType.self) { pathType in
                        switch pathType {
                        case .homeView:
                            HomeView()
                                .navigationBarBackButtonHidden()
                        case .MemoView:
                            MemoView()
                                .navigationBarBackButtonHidden()
                        case .todoView:
                            TodoView()
                                .navigationBarBackButtonHidden()
                                .environmentObject(todoListViewModel)
                        }
            }
        }
        .environmentObject(pathModel)
    }
}

// MARK: - 온보딩 컨텐츠뷰
private struct onboardingContentView : View {
    @ObservedObject private var onbaordingViewModel : OnboardingViewModel
    
    fileprivate init(onbaordingViewModel: OnboardingViewModel) {
        self.onbaordingViewModel = onbaordingViewModel
    }
    
    fileprivate var body: some View{
        VStack{
            // 온보딩 셀리스트 뷰
            OnboardingCellListView(onboardingViewModel: onbaordingViewModel)
            // 시작 버튼 뷰
            Spacer()
            StartBtnView()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK:  온보딩 셀리스트 뷰
private struct OnboardingCellListView : View {
    @ObservedObject private var onboardingViewModel : OnboardingViewModel
    @State private var seletedIndex : Int
    
    fileprivate init(onboardingViewModel: OnboardingViewModel, seletedIndex: Int = 0) {
        self.onboardingViewModel = onboardingViewModel
        self.seletedIndex = seletedIndex
    }
    
    fileprivate var body: some View{
        TabView(selection: $seletedIndex){
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element){ index, onboardinContent in
                OnboardingCellVIew(onboardingContent: onboardinContent)
                    .tag(index)
                
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 1.5)
        .background(
            seletedIndex % 2 == 0
            ? Color.customSky
            : Color.customBackgroundGreen
        )
        .clipped()
        
    }
}

// MARK : - 온보딩 셀뷰
private struct OnboardingCellVIew :View {
    private var onboardingContent : OnboardingContent
    
    fileprivate init(onboardingContent: OnboardingContent) {
        self.onboardingContent = onboardingContent
    }
    
    fileprivate var body: some View {
        VStack{
            Image(onboardingContent.imageFileName)
                .resizable()
                .scaledToFit()
            HStack{
                Spacer()
                
                VStack{
                    Spacer()
                        .frame(height: 40)
                    
                    Text(onboardingContent.title)
                        .font(.system(size: 16,weight: .bold))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(onboardingContent.subTitle)
                        .font(.system(size: 16))
                                        
                }
                
                Spacer()
            }
            .background(Color.customWhite)
            .cornerRadius(0)
        }
        .shadow(radius: 10)
    }
}

private struct StartBtnView : View {
    @EnvironmentObject private var pathModel : PathModel
    fileprivate var body: some View {
        Button (
            action: { pathModel.paths.append(.homeView)},
            label: {
                HStack{
                    Text("시작하기")
                        .font(.system(size: 16,weight: .medium))
                        .foregroundColor(.customGreen)
                    
                    Image("startHome")
                        .renderingMode(.template)
                        .foregroundColor(.customGreen)
                }
            })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
