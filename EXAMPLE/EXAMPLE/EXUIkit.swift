//
//  EXUIkit.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/25/24.
//

import SwiftUI
import UIKit

// UISegmentedControl을 SwiftUI에서 사용하기 위한 UIViewRepresentable
struct SegmentedControlView: UIViewRepresentable {
    @Binding var selectedSegment: Int

    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentControl = UISegmentedControl(items: ["First Tab", "Second Tab"])
        segmentControl.addTarget(context.coordinator, action: #selector(Coordinator.segmentedControlChanged(_:)), for: .valueChanged)

        return segmentControl
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedSegment
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: SegmentedControlView

        init(_ segmentedControlView: SegmentedControlView) {
            self.parent = segmentedControlView
        }

        @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
            parent.selectedSegment = sender.selectedSegmentIndex
        }
    }
}

// SwiftUI 뷰
struct EXUIkit: View {
    @State private var selectedSegment = 0

    var body: some View {
        VStack {
            // 여기서 세그먼트 컨트롤 뷰를 사용합니다
            SegmentedControlView(selectedSegment: $selectedSegment)
                .padding()

            // 선택된 세그먼트를 표시합니다
            Text("Selected Segment: \(selectedSegment)")
        }
    }
}

// SwiftUI 미리보기
struct EXUIkit_Previews: PreviewProvider {
    static var previews: some View {
        EXUIkit()
    }
}

