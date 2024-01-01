//
//  OnboardingView.swift
//  voiceMemo
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
  var body: some View {
      //TODO : - 화면 전환 구현 필요
    Text("Onboarding")
  }
}

// MARK: - 온보딩 컨텐츠뷰
private struct onboardingContentView : View {
    @ObservedObject private var onbaordingViewModel : OnboardingViewModel
    
    fileprivate init(onbaordingViewModel: OnboardingViewModel) {
        self.onbaordingViewModel = onbaordingViewModel
    }
    
    fileprivate var body: some View{
        
    }
    
    
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
