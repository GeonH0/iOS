//
//  FirstTabView.swift
//  EXAMPLE
//
//  Created by 김건호 on 2/1/24.
//

import SwiftUI

struct FirstTabView: View {
    @StateObject private var viewModel = ContentViewModel()
      
      var body: some View {
        CustomTabView(
          views: [
            .one: AnyView(BlueView()),
            .two:  AnyView(RedView()),
            .three:  AnyView(YellowView())
          ],
          selection: $viewModel.selectedTab
        )
      }
    }

    // MARK: - 하위 탭 컨텐츠 뷰
    private struct BlueView: View {
      fileprivate init() { }
      
      fileprivate var body: some View {
        Color.blue
      }
    }

    private struct RedView: View {
      fileprivate init() { }
      
      fileprivate var body: some View {
        Color.red
      }
    }

    private struct YellowView: View {
      fileprivate init() { }
      
      fileprivate var body: some View {
        Color.yellow
      }
    }

#Preview {
    FirstTabView()
}
