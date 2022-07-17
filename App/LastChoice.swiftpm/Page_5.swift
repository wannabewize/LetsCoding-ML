//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_5: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                직접 해 먹기는 귀찮으니 배달시켰다. 주문한 음식이 벌써 도착했고 맛있게 먹었다.

                그런데 쓰레기 양이 너무 많다. 어떻게 버리지?
                """)
                AssetImage("trashbin")
            }
            NavigationButton(title: "분리수거한다.", destination: Page_15())
            NavigationButton(title: "다 일반 쓰레기에 버린다.", destination: Page_6())
        }
        .padding()
        .navigationTitle("Page-5")
        .navigationBarTitleDisplayMode(.inline)
    }
}
