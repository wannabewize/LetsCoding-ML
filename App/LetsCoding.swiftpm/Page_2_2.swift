//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/15.
//

import SwiftUI

struct Page_2_2: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                텀블러까지 가져가긴 귀찮으니 그냥 일회용 컵에 받아 테이크 아웃 해 왔다. 갑자기 기온이 50도가 넘었다는 경보 알림이 떴다. 날씨가 왜 이러지?

                서둘러서 집에 도착하니 공기가 후덥지근하다. 시원한 바람이 필요하다.
                """)
                // 플레이그라운드 앱에 내장한 경우
                BundleImage(fileName: "page_img_2_2", ext: "png")
            }
            NavigationButton(title: "에어컨을 튼다", destination: SampleView())
            NavigationButton(title: "선풍기를 튼다", destination: SampleView())
            NavigationButton(title: "부채질을 한다.", destination: SampleView())

        }
        .padding()
        .navigationTitle("Page 2-2")
        .navigationBarTitleDisplayMode(.inline)
    }
}
