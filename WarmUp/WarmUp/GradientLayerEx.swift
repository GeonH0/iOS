//
//  GradientLayerEx.swift
//  WarmUp
//
//  Created by 김건호 on 12/13/23.
//

import SwiftUI


struct GradientLayerEx: View {
    var body: some View {
        // 그라데이션을 정의합니다.
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color(hex: "#08E8DE"), Color(hex: "#B3FFFF"), Color(hex: "#007B80"), Color(hex: "#FFFF99")]),
            startPoint: .topLeading, // 그라데이션 시작점
            endPoint: .bottomTrailing // 그라데이션 끝점
        )

        // 그라데이션을 배경으로 사용하는 Text 뷰
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 전체 화면을 채우도록 설정
            .background(gradient) // 그라데이션 배경 적용
            .edgesIgnoringSafeArea(.all) // 안전 영역을 무시하고 전체 화면에 적용
    }
}

// 16진수 색상 코드를 SwiftUI Color로 변환하는 확장
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}



#Preview {
    GradientLayerEx()
}
